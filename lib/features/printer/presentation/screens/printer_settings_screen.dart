import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/printer_device.dart';
import '../providers/printer_providers.dart';
import '../widgets/printer_widgets.dart';
import 'receipt_designer_screen.dart';

class PrinterSettingsScreen extends ConsumerWidget {
  const PrinterSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedPrinter = ref.watch(selectedPrinterNotifierProvider);
    final pairedAsync = ref.watch(pairedPrintersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('printer.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'printer.refresh'.tr(),
            onPressed: () => ref.invalidate(pairedPrintersProvider),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Status card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'printer.connection_status'.tr(),
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          const PrinterStatusBadge(),
                          if (selectedPrinter != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              selectedPrinter.name,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (selectedPrinter != null)
                      FilledButton.icon(
                        icon: const Icon(Icons.print_outlined),
                        label: Text('printer.test_print'.tr()),
                        onPressed: () => _testPrint(context, ref),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'printer.paired_devices'.tr(),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            pairedAsync.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (e, _) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(
                        Icons.bluetooth_disabled,
                        size: 48,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'printer.error_loading'.tr(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () => ref.invalidate(pairedPrintersProvider),
                        child: Text('common.retry'.tr()),
                      ),
                    ],
                  ),
                ),
              ),
              data: (devices) {
                if (devices.isEmpty) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Icon(
                            Icons.bluetooth_searching,
                            size: 48,
                            color: theme.hintColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'printer.no_devices'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: theme.hintColor),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  children: devices
                      .map(
                        (device) => PrinterDeviceTile(
                          device: device,
                          isActive:
                              selectedPrinter?.address == device.address,
                          onConnect: () => _connect(context, ref, device),
                          onDisconnect: () => _disconnect(context, ref),
                          onSetDefault: () => _setDefault(context, ref, device),
                        ),
                      )
                      .toList(),
                );
              },
            ),

            const SizedBox(height: 24),
            Row(
              children: [
                const Icon(Icons.palette_outlined),
                const SizedBox(width: 8),
                Text(
                  'receipt.designer_title'.tr(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ref.watch(allTemplatesProvider).when(
                  data: (templates) => Column(
                    children: templates
                        .map((t) => ListTile(
                              leading: Icon(
                                t.type == 'kitchen_ticket'
                                    ? Icons.restaurant_menu
                                    : Icons.receipt_long,
                              ),
                              title: Text(t.name),
                              subtitle: Text(t.type == 'kitchen_ticket'
                                  ? 'Kitchen Order'
                                  : 'Store Receipt'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ReceiptDesignerScreen(
                                    templateId: t.id,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
          ],
        ),
      ),
    );
  }

  Future<void> _connect(
    BuildContext context,
    WidgetRef ref,
    PrinterDevice device,
  ) async {
    try {
      await connectPrinter(ref, device);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('printer.connected_success'.tr(args: [device.name])),
      ));
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('printer.connect_failed'.tr()),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }
  }

  Future<void> _disconnect(BuildContext context, WidgetRef ref) async {
    try {
      await disconnectPrinter(ref);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('printer.disconnect_failed'.tr()),
      ));
    }
  }

  Future<void> _testPrint(BuildContext context, WidgetRef ref) async {
    try {
      await testPrint(ref);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('printer.test_print_success'.tr()),
      ));
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('printer.test_print_failed'.tr()),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }
  }

  Future<void> _setDefault(
    BuildContext context,
    WidgetRef ref,
    PrinterDevice device,
  ) async {
    await saveAsDefault(ref, device);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('printer.default_saved'.tr(args: [device.name])),
    ));
  }
}
