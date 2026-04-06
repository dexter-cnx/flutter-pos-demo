import 'package:isar/isar.dart';
import '../../domain/entities/app_job.dart';
import '../../domain/enums/job_status.dart';
import '../../domain/repositories/job_repository.dart';
import '../models/app_job_model.dart';

class JobRepositoryImpl implements JobRepository {
  final Isar _isar;

  JobRepositoryImpl(this._isar);

  @override
  Future<void> saveJob(AppJob job) async {
    final model = AppJobModel.fromDomain(job);
    
    final existing = await _isar.appJobModels.filter().jobIdEqualTo(job.id).findFirst();
    if (existing != null) {
      model.id = existing.id;
    }

    await _isar.writeTxn(() async {
      await _isar.appJobModels.put(model);
    });
  }

  @override
  Future<AppJob?> getJob(String id) async {
    final model = await _isar.appJobModels.filter().jobIdEqualTo(id).findFirst();
    return model?.toDomain();
  }

  @override
  Future<List<AppJob>> getJobsByStatus(JobStatus status) async {
    final models = await _isar.appJobModels.filter().statusEqualTo(status.name).findAll();
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<List<AppJob>> getPendingJobs() async {
    return getJobsByStatus(JobStatus.pending);
  }

  @override
  Future<void> deleteJob(String id) async {
    await _isar.writeTxn(() async {
      await _isar.appJobModels.filter().jobIdEqualTo(id).deleteAll();
    });
  }

  @override
  Future<void> deleteOldCompletedJobs(DateTime olderThan) async {
    await _isar.writeTxn(() async {
      await _isar.appJobModels
          .filter()
          .statusEqualTo(JobStatus.completed.name)
          .updatedAtLessThan(olderThan)
          .deleteAll();
    });
  }
}
