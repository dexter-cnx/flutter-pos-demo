import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/domain/enums/audit_event_type.dart';
import 'package:thai_pos_demo/shared/domain/entities/audit_event.dart';
import 'package:thai_pos_demo/shared/presentation/providers/audit_providers.dart';
import 'package:thai_pos_demo/shared/presentation/widgets/permission_guard.dart';
import 'package:thai_pos_demo/core/utils/thai_date_formatter.dart';

final auditEventsFilterProvider = StateProvider<AuditEventType?>((ref) => null);
final auditEventsDateProvider = StateProvider<DateTimeRange?>((ref) => null);
final auditEventsStaffIdProvider = StateProvider<String?>((ref) => null);

final filteredAuditEventsProvider = FutureProvider.autoDispose<List<AuditEvent>>((ref) async {
  final repository = ref.watch(auditRepositoryProvider);
  final typeFilter = ref.watch(auditEventsFilterProvider);
  final dateRange = ref.watch(auditEventsDateProvider);
  // Optional: Staff ID filtering might need repository enhancement; fallback to in-memory filter
  final staffId = ref.watch(auditEventsStaffIdProvider);

  List<AuditEvent> events = [];

  if (dateRange != null) {
    events = await repository.getAuditEventsByDateRange(dateRange.start, dateRange.end);
    if (typeFilter != null) {
      events = events.where((e) => e.eventType == typeFilter.name).toList();
    }
  } else if (typeFilter != null) {
    events = await repository.getAuditEventsByType(typeFilter.name);
  } else {
    // If no filter, get last 100 via a custom repo method, or we fetch today's
    final now = DateTime.now();
    events = await repository.getAuditEventsByDateRange(
      DateTime(now.year, now.month, now.day - 7), // default 7 days back
      DateTime(now.year, now.month, now.day, 23, 59, 59),
    );
  }

  if (staffId != null && staffId.isNotEmpty) {
    events = events.where((e) => e.actorId == staffId).toList();
  }

  // Sort descending by timestamp
  events.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  return events;
});

class AuditLogViewerPage extends ConsumerWidget {
  const AuditLogViewerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionGuard(
      permission: AppPermission.settingsEdit, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('settings.audit_log'.tr()),
        ),
        body: Column(
          children: [
            const _AuditFilters(),
            const Divider(),
            Expanded(
              child: ref.watch(filteredAuditEventsProvider).when(
                    data: (events) => _AuditList(events: events),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Center(child: Text('Error loading events: $e')),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuditFilters extends ConsumerWidget {
  const _AuditFilters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(auditEventsFilterProvider);
    final dateRange = ref.watch(auditEventsDateProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: InputDecorator(
              decoration: const InputDecoration(labelText: 'Event Type', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<AuditEventType?>(
                  value: selectedType,
                  isExpanded: true,
                  items: [
                    const DropdownMenuItem(value: null, child: Text('All Events')),
                    ...AuditEventType.values.map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.name),
                        )),
                  ],
                  onChanged: (val) => ref.read(auditEventsFilterProvider.notifier).state = val,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: InkWell(
              onTap: () async {
                final result = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  initialDateRange: dateRange,
                );
                if (result != null) {
                  ref.read(auditEventsDateProvider.notifier).state = result;
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date Range',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(dateRange != null
                    ? '${ThaiDateFormatter.formatShortBE(dateRange.start)} - ${ThaiDateFormatter.formatShortBE(dateRange.end)}'
                    : 'Last 7 Days'),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              ref.read(auditEventsFilterProvider.notifier).state = null;
              ref.read(auditEventsDateProvider.notifier).state = null;
              ref.read(auditEventsStaffIdProvider.notifier).state = null;
            },
            tooltip: 'Clear Filters',
          )
        ],
      ),
    );
  }
}

class _AuditList extends StatelessWidget {
  final List<AuditEvent> events;
  const _AuditList({required this.events});

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(
        child: Text('No audit events found.'),
      );
    }
    return ListView.separated(
      itemCount: events.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          leading: const Icon(Icons.history, color: Colors.blueGrey),
          title: Text(event.summary),
          subtitle: Text('${ThaiDateFormatter.formatFullBE(event.timestamp)} • Actor: ${event.actorLabel ?? event.actorId ?? "System"}'),
          trailing: Chip(label: Text(event.eventType)),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Event Details'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Action: ${event.action}'),
                      Text('Entity Type: ${event.entityType}'),
                      Text('Entity ID: ${event.entityId}'),
                      const SizedBox(height: 16),
                      const Text('Payload:', style: TextStyle(fontWeight: FontWeight.bold)),
                      if (event.payload != null) Text(event.payload.toString()) else const Text('None'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
