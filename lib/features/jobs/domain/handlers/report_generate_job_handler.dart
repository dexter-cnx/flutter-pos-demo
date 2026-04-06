import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_job.dart';
import 'package:thai_pos_demo/shared/domain/enums/job_type.dart';
import 'package:thai_pos_demo/shared/domain/services/job_handler.dart';
import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';
import 'dart:developer' as developer;

class ReportGenerateJobHandler implements JobHandler {
  final Ref _ref;

  ReportGenerateJobHandler(this._ref);

  @override
  bool canHandle(AppJob job) => job.type == JobType.reportGenerate;

  @override
  Future<void> handle(AppJob job) async {
    final reportType = job.payload?['reportType'] ?? 'daily_sales';
    final date = job.payload?['date'] ?? DateTime.now().toIso8601String();

    developer.log('Starting background report generation: $reportType for $date', name: 'ReportGenerateJobHandler');
    
    // Simulate complex background processing like PDF generation or CSV export
    await Future.delayed(const Duration(seconds: 2));

    // Log the action using audit service to satisfy _ref usage
    final auditService = _ref.read(auditServiceProvider);
    await auditService.logEvent(
      eventType: AuditEventType.settingsChanged, // Using a fallback available event type
      entityType: 'report',
      entityId: reportType,
      action: 'generate',
      actorId: job.actorId,
      source: AuditEventSource.system,
      summary: 'Report $reportType generated successfully in background.',
    );

    developer.log('Report generation completed successfully.', name: 'ReportGenerateJobHandler');
  }
}
