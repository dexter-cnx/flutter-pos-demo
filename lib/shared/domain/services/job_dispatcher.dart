import 'dart:async';
import 'package:uuid/uuid.dart';
import '../entities/app_job.dart';
import '../enums/job_status.dart';
import '../enums/job_type.dart';
import '../enums/job_priority.dart';
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
    JobPriority? priority,
    Map<String, dynamic>? payload,
    String? sourceEntityId,
    String? actorId,
  }) async {
    // Default priority based on job type if not provided
    final effectivePriority = priority ?? _getDefaultPriority(type);

    final job = AppJob(
      id: _uuid.v4(),
      type: type,
      status: JobStatus.pending,
      priority: effectivePriority,
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

  JobPriority _getDefaultPriority(JobType type) {
    return switch (type) {
      JobType.receiptReprint => JobPriority.high,
      JobType.queueDisplayRefresh => JobPriority.high,
      JobType.notifyQueueCalled => JobPriority.urgent,
      JobType.syncPendingTransactions => JobPriority.low,
      JobType.reportGenerate => JobPriority.medium,
      _ => JobPriority.medium,
    };
  }

  /// Processes pending jobs in the queue
  Future<void> _processPendingJobs() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final pendingJobs = await _repository.getPendingJobs();
      
      // Sort: Urgent (3) > High (2) > Medium (1) > Low (0)
      pendingJobs.sort((a, b) => b.priority.index.compareTo(a.priority.index));

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

  /// Retries a failed job manually, ignoring global retry limits.
  Future<void> retryJob(String jobId) async {
    final job = await _repository.getJob(jobId);
    if (job == null || job.status != JobStatus.failed) return;
    
    final retryingJob = job.copyWith(
      status: JobStatus.pending,
      updatedAt: DateTime.now(),
      errorMessage: null, // Clear error message since it's going back to pending
    );
    await _repository.saveJob(retryingJob);

    // Fire and forget
    _processPendingJobs();
  }

  /// Removes a job entirely from the queue
  Future<void> purgeJob(String jobId) async {
    await _repository.deleteJob(jobId);
  }

  /// Automatically clears completed jobs older than 30 days to prevent DB growth.
  Future<void> autoPurgeOldJobs({int retentionDays = 30}) async {
    final olderThan = DateTime.now().subtract(Duration(days: retentionDays));
    await _repository.deleteOldCompletedJobs(olderThan);
    developer.log('Auto-purge: Completed jobs older than $retentionDays days cleared.', name: 'JobDispatcher');
  }
}
