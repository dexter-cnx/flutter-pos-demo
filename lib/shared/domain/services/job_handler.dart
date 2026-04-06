import '../entities/app_job.dart';

/// Base interface for job handlers
abstract class JobHandler {
  /// Whether this handler can process the given job
  bool canHandle(AppJob job);

  /// Process the job. Throws an exception if failed.
  Future<void> handle(AppJob job);
}
