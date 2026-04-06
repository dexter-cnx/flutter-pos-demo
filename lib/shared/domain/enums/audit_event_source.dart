/// Enum representing different sources of audit events
enum AuditEventSource {
  /// Staff-initiated actions
  staff,

  /// System-initiated actions
  system,

  /// Background job/initiated actions
  job,

  /// Customer-initiated actions (future-ready)
  customer,

  /// External system/integration
  external,

  /// Unknown source
  unknown,
}