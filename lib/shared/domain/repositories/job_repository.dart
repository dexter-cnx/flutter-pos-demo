import '../entities/app_job.dart';
import '../enums/job_status.dart';

abstract class JobRepository {
  Future<void> saveJob(AppJob job);
  Future<AppJob?> getJob(String id);
  Future<List<AppJob>> getJobsByStatus(JobStatus status);
  Future<List<AppJob>> getPendingJobs();
  Future<void> deleteJob(String id);
  Future<void> deleteOldCompletedJobs(DateTime olderThan);
}
