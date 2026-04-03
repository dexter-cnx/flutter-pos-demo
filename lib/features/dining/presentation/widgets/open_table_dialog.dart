import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/entities/buffet_tier.dart';
import '../providers/buffet_tier_providers.dart';

class SessionConfig {
  final int adultCount;
  final int childCount;
  final int elderlyCount;
  final BuffetTier? buffetTier;
  final bool isBuffet;

  SessionConfig({
    required this.adultCount,
    required this.childCount,
    required this.elderlyCount,
    this.buffetTier,
    required this.isBuffet,
  });
}

class OpenTableDialog extends ConsumerStatefulWidget {
  const OpenTableDialog({
    super.key,
    required this.tableName,
    required this.capacity,
  });

  final String tableName;
  final int capacity;

  @override
  ConsumerState<OpenTableDialog> createState() => _OpenTableDialogState();
}

class _OpenTableDialogState extends ConsumerState<OpenTableDialog> {
  bool isBuffet = false;
  BuffetTier? selectedTier;

  int adultCount = 1;
  int childCount = 0;
  int elderlyCount = 0;

  @override
  Widget build(BuildContext context) {
    final tiersAsync = ref.watch(activeBuffetTiersProvider);

    return AlertDialog(
      title: Text('pos.restaurant.open_table'.tr(args: [widget.tableName])),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Type Selection ---
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('À La Carte')),
                ButtonSegment(value: true, label: Text('Buffet')),
              ],
              selected: {isBuffet},
              onSelectionChanged: (set) {
                setState(() => isBuffet = set.first);
              },
            ),
            const SizedBox(height: 16),

            // --- Buffet Tier Selection ---
            if (isBuffet) ...[
              Text('เลือกแพ็คเกจ:', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              tiersAsync.when(
                data: (tiers) {
                  if (tiers.isEmpty) return const Text('ไม่มีแพ็คเกจบุฟเฟต์');
                  
                  // Auto-select first tier
                  if (selectedTier == null) {
                    Future.microtask(() => setState(() => selectedTier = tiers.first));
                  }

                  return DropdownButtonFormField<BuffetTier>(
                    initialValue: selectedTier,
                    items: tiers.map((tier) {
                      return DropdownMenuItem(
                        value: tier,
                        child: Text('${tier.name} (ผู้ใหญ่ ฿${tier.adultPrice} / เด็ก ฿${tier.childPrice})'),
                      );
                    }).toList(),
                    onChanged: (tier) => setState(() => selectedTier = tier),
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Text('Error loading tiers: $e'),
              ),
              if (selectedTier?.timeLimitMinutes != null) ...[
                const SizedBox(height: 8),
                Text('เวลาทาน: ${selectedTier!.timeLimitMinutes} นาที', style: TextStyle(color: Colors.green)),
              ],
              const SizedBox(height: 16),
            ],

            // --- Headcount ---
            Text('จำนวนลูกค้า:', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 16),
            _buildCounter('ผู้ใหญ่', adultCount, (v) => setState(() => adultCount = v), min: 1),
            _buildCounter('เด็ก', childCount, (v) => setState(() => childCount = v)),
            _buildCounter('ผู้สูงอายุ', elderlyCount, (v) => setState(() => elderlyCount = v)),
            const SizedBox(height: 16),

            // --- Starting Total ---
            if (isBuffet && selectedTier != null) ...[
              const Divider(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ยอดเริ่มต้น:', style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    '฿${_calculateStartingTotal().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('common.cancel'.tr()),
        ),
        FilledButton(
          onPressed: () {
            if (isBuffet && selectedTier == null) return;
            Navigator.of(context).pop(SessionConfig(
              adultCount: adultCount,
              childCount: childCount,
              elderlyCount: elderlyCount,
              isBuffet: isBuffet,
              buffetTier: isBuffet ? selectedTier : null,
            ));
          },
          child: Text('common.confirm'.tr()),
        ),
      ],
    );
  }

  Widget _buildCounter(String label, int value, ValueChanged<int> onChanged, {int min = 0}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: value > min ? () => onChanged(value - 1) : null,
              ),
              SizedBox(
                width: 30,
                child: Text('$value', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () => onChanged(value + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _calculateStartingTotal() {
    if (selectedTier == null) return 0;
    final adult = adultCount * selectedTier!.adultPrice;
    final child = childCount * selectedTier!.childPrice;
    final elderly = elderlyCount * selectedTier!.adultPrice * (1.0 - selectedTier!.elderlyDiscount);
    return adult + child + elderly;
  }
}
