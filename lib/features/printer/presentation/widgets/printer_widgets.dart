import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/printer_device.dart';
import '../../domain/entities/printer_status.dart';
import '../providers/printer_providers.dart';

/// Status badge showing current connection state.
class PrinterStatusBadge extends ConsumerWidget {
  const PrinterStatusBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(printerStatusNotifierProvider);
    final theme = Theme.of(context);

    final (label, color, icon) = switch (status) {
      PrinterStatus.connected => (
          'printer.status_connected'.tr(),
          Colors.green,
          Icons.bluetooth_connected,
        ),
      PrinterStatus.printing => (
          'printer.status_printing'.tr(),
          theme.colorScheme.primary,
          Icons.print,
        ),
      PrinterStatus.scanning => (
          'printer.status_scanning'.tr(),
          Colors.orange,
          Icons.bluetooth_searching,
        ),
      PrinterStatus.error => (
          'printer.status_error'.tr(),
          theme.colorScheme.error,
          Icons.error_outline,
        ),
      PrinterStatus.disconnected => (
          'printer.status_disconnected'.tr(),
          theme.hintColor,
          Icons.bluetooth_disabled,
        ),
      PrinterStatus.idle => (
          'printer.status_idle'.tr(),
          theme.hintColor,
          Icons.bluetooth,
        ),
    };

    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
      backgroundColor: color.withValues(alpha: 0.12),
      side: BorderSide(color: color.withValues(alpha: 0.3)),
    );
  }
}

/// Single printer row in the paired-printers list.
class PrinterDeviceTile extends StatelessWidget {
  const PrinterDeviceTile({
    super.key,
    required this.device,
    required this.isActive,
    required this.onConnect,
    required this.onDisconnect,
    required this.onSetDefault,
  });

  final PrinterDevice device;
  final bool isActive;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;
  final VoidCallback onSetDefault;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isActive
            ? BorderSide(color: theme.colorScheme.primary, width: 1.5)
            : BorderSide(color: theme.dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              isActive ? Icons.bluetooth_connected : Icons.bluetooth,
              color: isActive ? theme.colorScheme.primary : theme.hintColor,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        device.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (device.isDefault) ...[
                        const SizedBox(width: 8),
                        Chip(
                          label: Text(
                            'printer.default_label'.tr(),
                            style: const TextStyle(fontSize: 11),
                          ),
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          backgroundColor:
                              theme.colorScheme.primaryContainer,
                        ),
                      ],
                    ],
                  ),
                  Text(
                    device.address,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Wrap(
              spacing: 6,
              children: [
                if (!device.isDefault)
                  OutlinedButton(
                    onPressed: onSetDefault,
                    child: Text('printer.set_default'.tr()),
                  ),
                if (isActive)
                  OutlinedButton(
                    onPressed: onDisconnect,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    ),
                    child: Text('printer.disconnect'.tr()),
                  )
                else
                  FilledButton(
                    onPressed: onConnect,
                    child: Text('printer.connect'.tr()),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
