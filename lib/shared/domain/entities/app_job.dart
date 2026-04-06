import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/job_status.dart';
import '../enums/job_type.dart';

part 'app_job.freezed.dart';
part 'app_job.g.dart';

@freezed
class AppJob with _$AppJob {
  const AppJob._();

  const factory AppJob({
    required String id,
    required JobType type,
    required JobStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0) int retryCount,
    String? errorMessage,
    Map<String, dynamic>? payload,
    String? sourceEntityId,
    String? actorId,
  }) = _AppJob;

  factory AppJob.fromJson(Map<String, dynamic> json) => _$AppJobFromJson(json);
}
