import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/job_repository_impl.dart';
import '../../domain/repositories/job_repository.dart';
import '../../domain/services/job_dispatcher.dart';
import '../../../shared/presentation/providers/audit_providers.dart'; 
import '../../../features/jobs/domain/handlers/receipt_reprint_job_handler.dart';
import '../../../features/jobs/domain/handlers/report_generate_job_handler.dart';

part 'job_providers.g.dart';

@Riverpod(keepAlive: true)
JobRepository jobRepository(JobRepositoryRef ref) {
  final isarInstance = ref.watch(isarProvider);
  return JobRepositoryImpl(isarInstance);
}

@Riverpod(keepAlive: true)
JobDispatcher jobDispatcher(JobDispatcherRef ref) {
  final repository = ref.watch(jobRepositoryProvider);
  final dispatcher = JobDispatcher(repository);
  
  // Register default handlers
  dispatcher.registerHandler(ReceiptReprintJobHandler(ref));
  dispatcher.registerHandler(ReportGenerateJobHandler(ref));
  
  // Clean up old completed jobs on bootstrap (fire and forget)
  dispatcher.autoPurgeOldJobs(retentionDays: 30);
  
  return dispatcher;
}
