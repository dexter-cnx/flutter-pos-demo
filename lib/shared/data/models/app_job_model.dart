import 'dart:convert';
import 'package:isar/isar.dart';
import '../../domain/entities/app_job.dart';
import '../../domain/enums/job_status.dart';
import '../../domain/enums/job_type.dart';

part 'app_job_model.g.dart';

@collection
class AppJobModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String jobId;

  @Index()
  late String type;

  @Index()
  late String status;

  late DateTime createdAt;
  late DateTime updatedAt;
  late int retryCount;
  String? errorMessage;
  String? payloadJson;
  String? sourceEntityId;
  String? actorId;

  AppJobModel();

  factory AppJobModel.fromDomain(AppJob job) {
    return AppJobModel()
      ..jobId = job.id
      ..type = job.type.name
      ..status = job.status.name
      ..createdAt = job.createdAt
      ..updatedAt = job.updatedAt
      ..retryCount = job.retryCount
      ..errorMessage = job.errorMessage
      ..payloadJson = job.payload != null ? jsonEncode(job.payload) : null
      ..sourceEntityId = job.sourceEntityId
      ..actorId = job.actorId;
  }

  AppJob toDomain() {
    return AppJob(
      id: jobId,
      type: JobType.values.firstWhere((e) => e.name == type, orElse: () => JobType.other),
      status: JobStatus.values.firstWhere((e) => e.name == status, orElse: () => JobStatus.pending),
      createdAt: createdAt,
      updatedAt: updatedAt,
      retryCount: retryCount,
      errorMessage: errorMessage,
      payload: payloadJson != null ? jsonDecode(payloadJson!) : null,
      sourceEntityId: sourceEntityId,
      actorId: actorId,
    );
  }
}
