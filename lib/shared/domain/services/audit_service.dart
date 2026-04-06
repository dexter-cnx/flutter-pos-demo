import 'package:thai_pos_demo/shared/domain/entities/audit_event.dart';
import 'package:thai_pos_demo/shared/domain/repositories/audit_repository.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_source.dart';
import 'package:uuid/uuid.dart';

/// Service for managing audit events
class AuditService {
  final AuditRepository _auditRepository;
  final Uuid _uuid = const Uuid();

  /// Creates a new audit service
  AuditService(this._auditRepository);

  /// Logs a new audit event
  Future<void> logEvent({
    required AuditEventType eventType,
    required String entityType,
    required String entityId,
    required String action,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
    required String summary,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? beforeAfterStatus,
  }) async {
    final auditEvent = AuditEvent(
      id: _uuid.v4(),
      eventType: eventType.name,
      entityType: entityType,
      entityId: entityId,
      action: action,
      actorId: actorId,
      actorLabel: actorLabel,
      source: source.name,
      timestamp: DateTime.now(),
      summary: summary,
      payload: payload,
      beforeAfterStatus: beforeAfterStatus,
    );

    await _auditRepository.saveAuditEvent(auditEvent);
  }

  /// Logs a transaction lifecycle transition
  Future<void> logTransactionLifecycleTransition({
    required String transactionId,
    required String fromState,
    required String toState,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
  }) async {
    await logEvent(
      eventType: AuditEventType.transactionCompleted,
      entityType: 'transaction',
      entityId: transactionId,
      action: '$fromState}_to_$toState',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: 'Transaction transitioned from $fromState to $toState',
      beforeAfterStatus: {
        'from': fromState,
        'to': toState,
      },
    );
  }

  /// Logs a receipt lifecycle transition
  Future<void> logReceiptLifecycleTransition({
    required String receiptId,
    required String fromState,
    required String toState,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
  }) async {
    await logEvent(
      eventType: AuditEventType.receiptGenerated,
      entityType: 'receipt',
      entityId: receiptId,
      action: '$fromState}_to_$toState',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: 'Receipt transitioned from $fromState to $toState',
      beforeAfterStatus: {
        'from': fromState,
        'to': toState,
      },
    );
  }

  /// Logs a payment lifecycle transition
  Future<void> logPaymentLifecycleTransition({
    required String paymentId,
    required String fromState,
    required String toState,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
  }) async {
    await logEvent(
      eventType: AuditEventType.paymentCompleted,
      entityType: 'payment',
      entityId: paymentId,
      action: '$fromState}_to_$toState',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: 'Payment transitioned from $fromState to $toState',
      beforeAfterStatus: {
        'from': fromState,
        'to': toState,
      },
    );
  }

  /// Logs a settings change
  Future<void> logSettingsChange({
    required String settingName,
    required String oldValue,
    required String newValue,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
  }) async {
    await logEvent(
      eventType: AuditEventType.settingsChanged,
      entityType: 'setting',
      entityId: settingName,
      action: 'updated',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: 'Setting $settingName changed from "$oldValue" to "$newValue"',
      payload: {
        'old_value': oldValue,
        'new_value': newValue,
      },
    );
  }

  /// Logs a receipt print action
  Future<void> logReceiptPrint({
    required String receiptId,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
    bool isReprint = false,
  }) async {
    await logEvent(
      eventType: isReprint ? AuditEventType.receiptReprinted : AuditEventType.receiptPrinted,
      entityType: 'receipt',
      entityId: receiptId,
      action: isReprint ? 'reprinted' : 'printed',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: isReprint
          ? 'Receipt $receiptId reprinted'
          : 'Receipt $receiptId printed',
    );
  }

  /// Logs a payment failure
  Future<void> logPaymentFailure({
    required String paymentId,
    required String failureReason,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
  }) async {
    await logEvent(
      eventType: AuditEventType.paymentFailed,
      entityType: 'payment',
      entityId: paymentId,
      action: 'failed',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: 'Payment $paymentId failed: $failureReason',
      payload: {
        'failure_reason': failureReason,
      },
    );
  }

  /// Logs a transaction void action
  Future<void> logTransactionVoid({
    required String transactionId,
    String? reason,
    String? actorId,
    String? actorLabel,
    required AuditEventSource source,
  }) async {
    await logEvent(
      eventType: AuditEventType.transactionVoided,
      entityType: 'transaction',
      entityId: transactionId,
      action: 'voided',
      actorId: actorId,
      actorLabel: actorLabel,
      source: source,
      summary: 'Transaction $transactionId voided${reason != null ? ': $reason' : ''}',
      payload: reason != null ? {'reason': reason} : null,
    );
  }
}