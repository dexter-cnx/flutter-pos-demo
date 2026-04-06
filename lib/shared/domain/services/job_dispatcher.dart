import 'dart:async';
import 'package:uuid/uuid.dart';
import '../entities/app_job.dart';
import '../enums/job_status.dart';
import '../enums/job_type.dart';
import '../repositories/job_repository.dart';
import 'job_handler.dart';
import 'dart:developer' as developer;

class JobDispatcher {
  final JobRepository _repository;
  final List<JobHandler> _handlers = [];
  final Uuid _uuid = const Uuid();
  bool _isProcessing = false;

  JobDispatcher(this._repository);

  void registerHandler(JobHandler handler) {
    _handlers.add(handler);
  }

  /// Dispatch a new job manually
  Future<String> dispatch({
    required JobType type,
    Map<String, dynamic>? payload,
    String? sourceEntityId,
    String? actorId,
  }) async {
    final job = AppJob(
      id: _uuid.v4(),
      type: type,
      status: JobStatus.pending,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      payload: payload,
      sourceEntityId: sourceEntityId,
      actorId: actorId,
    );

    await _repository.saveJob(job);
    
    // Fire and forget processing
    _processPendingJobs();
    
    return job.id;
  }

  /// Processes pending jobs in the queue
  Future<void> _processPendingJobs() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final pendingJobs = await _repository.getPendingJobs();
      
      for (final job in pendingJobs) {
        await _processJob(job);
      }
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _processJob(AppJob job) async {
    final handler = _handlers.where((h) => h.canHandle(job)).firstOrNull;

    if (handler == null) {
      developer.log('No handler found for job: ${job.type}', name: 'JobDispatcher');
      final failedJob = job.copyWith(
        status: JobStatus.failed,
        errorMessage: 'No handler configured for ${job.type}',
        updatedAt: DateTime.now(),
      );
      await _repository.saveJob(failedJob);
      return;
    }

    final runningJob = job.copyWith(
      status: JobStatus.running,
      updatedAt: DateTime.now(),
    );
    await _repository.saveJob(runningJob);

    try {
      await handler.handle(runningJob);
      
      final completedJob = runningJob.copyWith(
        status: JobStatus.completed,
        updatedAt: DateTime.now(),
      );
      await _repository.saveJob(completedJob);
    } catch (e) {
      developer.log('Job failed: ${e.toString()}', name: 'JobDispatcher', error: e);
      final isFinalFailure = runningJob.retryCount >= 3; // Basic retry policy
      
      final failedJob = runningJob.copyWith(
        status: isFinalFailure ? JobStatus.failed : JobStatus.pending,
        retryCount: runningJob.retryCount + 1,
        errorMessage: e.toString(),
        updatedAt: DateTime.now(),
      );
      await _repository.saveJob(failedJob);
    }
  }
}
