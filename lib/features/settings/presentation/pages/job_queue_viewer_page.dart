import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_job.dart';
import 'package:thai_pos_demo/shared/domain/enums/job_status.dart';
import 'package:thai_pos_demo/shared/presentation/providers/job_providers.dart';
import 'package:thai_pos_demo/shared/presentation/widgets/permission_guard.dart';
import 'package:thai_pos_demo/core/utils/thai_date_formatter.dart';

final jobQueueFilterProvider = StateProvider<JobStatus?>((ref) => null);

final filteredJobsProvider = FutureProvider.autoDispose<List<AppJob>>((ref) async {
  final repository = ref.watch(jobRepositoryProvider);
  final statusFilter = ref.watch(jobQueueFilterProvider);

  List<AppJob> jobs;
  if (statusFilter != null) {
    jobs = await repository.getJobsByStatus(statusFilter);
  } else {
    // Assuming a method doesn't exist to get all jobs easily, we can compose or just add one:
    // Let's manually fetch all statuses for now to simulate a "getAllJobs"
    jobs = [];
    for (final status in JobStatus.values) {
      jobs.addAll(await repository.getJobsByStatus(status));
    }
  }

  // Sort descending by created timestamp
  jobs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return jobs;
});

class JobQueueViewerPage extends ConsumerWidget {
  const JobQueueViewerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionGuard(
      permission: AppPermission.settingsEdit, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('settings.job_queue'.tr()),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => ref.invalidate(filteredJobsProvider),
            )
          ],
        ),
        body: Column(
          children: [
            const _JobFilters(),
            const Divider(),
            Expanded(
              child: ref.watch(filteredJobsProvider).when(
                    data: (jobs) => _JobList(jobs: jobs),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Center(child: Text('Error loading jobs: $e')),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JobFilters extends ConsumerWidget {
  const _JobFilters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatus = ref.watch(jobQueueFilterProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: InputDecorator(
              decoration: const InputDecoration(labelText: 'Status Filter', border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<JobStatus?>(
                  value: selectedStatus,
                  isExpanded: true,
                  items: [
                    const DropdownMenuItem(value: null, child: Text('All Statuses')),
                    ...JobStatus.values.map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status.name.toUpperCase()),
                        )),
                  ],
                  onChanged: (val) => ref.read(jobQueueFilterProvider.notifier).state = val,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _JobList extends ConsumerWidget {
  final List<AppJob> jobs;
  const _JobList({required this.jobs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (jobs.isEmpty) {
      return const Center(
        child: Text('No background jobs found.'),
      );
    }
    return ListView.separated(
      itemCount: jobs.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final job = jobs[index];
        final isFailed = job.status == JobStatus.failed;

        return ListTile(
          leading: Icon(
            _getIconForStatus(job.status),
            color: _getColorForStatus(job.status),
          ),
          title: Text('${job.type.name} (Tries: ${job.retryCount})'),
          subtitle: Text('${ThaiDateFormatter.formatFullBE(job.updatedAt)}\n${job.errorMessage ?? "No errors"}'),
          isThreeLine: true,
          trailing: isFailed
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.orange),
                      tooltip: 'Retry Job',
                      onPressed: () async {
                        await ref.read(jobDispatcherProvider).retryJob(job.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job re-queued')));
                          ref.invalidate(filteredJobsProvider);
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                      tooltip: 'Purge Job',
                      onPressed: () async {
                        await ref.read(jobDispatcherProvider).purgeJob(job.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job purged')));
                          ref.invalidate(filteredJobsProvider);
                        }
                      },
                    ),
                  ],
                )
              : Chip(label: Text(job.status.name)),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Job Details'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Job ID: ${job.id}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text('Entity ID: ${job.sourceEntityId ?? "N/A"}'),
                      Text('Actor ID: ${job.actorId ?? "System"}'),
                      const SizedBox(height: 16),
                      const Text('Payload:', style: TextStyle(fontWeight: FontWeight.bold)),
                      if (job.payload != null) Text(job.payload.toString()) else const Text('None'),
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

  IconData _getIconForStatus(JobStatus status) {
    return switch (status) {
      JobStatus.pending => Icons.hourglass_empty,
      JobStatus.running => Icons.sync,
      JobStatus.completed => Icons.check_circle,
      JobStatus.failed => Icons.error,
      JobStatus.cancelled => Icons.cancel,
    };
  }

  Color _getColorForStatus(JobStatus status) {
    return switch (status) {
      JobStatus.pending => Colors.blueGrey,
      JobStatus.running => Colors.blue,
      JobStatus.completed => Colors.green,
      JobStatus.failed => Colors.red,
      JobStatus.cancelled => Colors.grey,
    };
  }
}
