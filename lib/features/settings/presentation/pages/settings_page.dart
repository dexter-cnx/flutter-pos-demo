import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/bootstrap.dart';
import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/l10n/localization.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../domain/entities/store_profile.dart';
import '../providers/settings_providers.dart';
import '../../../orders/presentation/providers/order_history_provider.dart';
import '../../../pos/presentation/providers/pos_providers.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryCountAsync = ref.watch(categoryCountProvider);
    final productCountAsync = ref.watch(productCountProvider);
    final ordersAsync = ref.watch(ordersProvider);
    final orderCountAsync = ref.watch(orderCountProvider);
    final lowStockCountAsync = ref.watch(lowStockCountProvider);
    final storeProfileAsync = ref.watch(storeProfileProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/'),
        ),
        title: Text('settings.title'.tr()),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final columns = responsive.settingsColumnCount;
            final totalSpacing = 16.0 * (columns - 1);
            final cardWidth =
                ((constraints.maxWidth - totalSpacing) / columns).clamp(
              280.0,
              constraints.maxWidth,
            );

            final cards = [
              SizedBox(
                width: cardWidth,
                child: _SettingsCard(
                  title: 'settings.language'.tr(),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: AppLocalization.supportedLocales.map((locale) {
                      final isSelected =
                          context.locale.languageCode == locale.languageCode;
                      final label = locale.languageCode == 'th'
                          ? 'settings.language_th'.tr()
                          : 'settings.language_en'.tr();
                      return ChoiceChip(
                        label: Text(label),
                        selected: isSelected,
                        onSelected: (_) => context.setLocale(locale),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _SettingsCard(
                  title: 'settings.storage'.tr(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(
                        label: 'settings.mode_label'.tr(),
                        value: 'settings.offline_first'.tr(),
                      ),
                      _InfoRow(
                        label: 'settings.persistence'.tr(),
                        value: isar != null
                            ? 'settings.storage_ready'.tr()
                            : 'settings.storage_unavailable'.tr(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _SettingsCard(
                  title: 'settings.data_summary'.tr(),
                  child: Column(
                    children: [
                      _AsyncInfoRow(
                        label: 'settings.categories_count'.tr(),
                        asyncValue: categoryCountAsync,
                        valueBuilder: (count) => count.toString(),
                      ),
                      _AsyncInfoRow(
                        label: 'settings.products_count'.tr(),
                        asyncValue: productCountAsync,
                        valueBuilder: (count) => count.toString(),
                      ),
                      _AsyncInfoRow(
                        label: 'settings.orders_count'.tr(),
                        asyncValue: orderCountAsync,
                        valueBuilder: (count) => count.toString(),
                      ),
                      _AsyncInfoRow(
                        label: 'settings.low_stock_items'.tr(),
                        asyncValue: lowStockCountAsync,
                        valueBuilder: (count) => count.toString(),
                      ),
                      _AsyncInfoRow(
                        label: 'settings.latest_order'.tr(),
                        asyncValue: ordersAsync,
                        valueBuilder: (orders) {
                          if (orders.isEmpty) {
                            return 'settings.no_orders'.tr();
                          }
                          return DateFormat('dd/MM/yyyy HH:mm')
                              .format(orders.first.createdAt.toLocal());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: storeProfileAsync.when(
                  data: (profile) => _StoreProfileCard(profile: profile),
                  loading: () => const _LoadingCard(),
                  error: (error, _) => _ErrorCard(error: error.toString()),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _SettingsCard(
                  title: 'settings.management'.tr(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('settings.clear_orders_hint'.tr()),
                      const SizedBox(height: 16),
                      orderCountAsync.when(
                        data: (count) => Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            FilledButton.icon(
                              onPressed: count == 0 || isar == null
                                  ? null
                                  : () => _confirmClearOrders(context, ref),
                              icon: const Icon(Icons.delete_sweep_outlined),
                              label: Text('settings.clear_orders'.tr()),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => context.go('/inventory'),
                              icon: const Icon(Icons.inventory_2_outlined),
                              label: Text('inventory.title'.tr()),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => context.go('/history'),
                              icon: const Icon(Icons.history),
                              label: Text('receipt.view_history'.tr()),
                            ),
                          ],
                        ),
                        loading: () => const AppLoadingState(compact: true),
                        error: (error, _) => AppErrorState(
                          message: error.toString(),
                          compact: true,
                          onRetry: () => ref.invalidate(orderCountProvider),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: cards,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _confirmClearOrders(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('settings.confirm_clear_title'.tr()),
              content: Text('settings.confirm_clear_message'.tr()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('common.cancel'.tr()),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('settings.confirm_clear_action'.tr()),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!confirmed) return;

    await ref.read(orderHistoryProvider.notifier).clearOrders();
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('settings.clear_orders_success'.tr())),
    );
  }
}

class _StoreProfileCard extends ConsumerStatefulWidget {
  const _StoreProfileCard({required this.profile});

  final StoreProfile profile;

  @override
  ConsumerState<_StoreProfileCard> createState() => _StoreProfileCardState();
}

class _StoreProfileCardState extends ConsumerState<_StoreProfileCard> {
  late final TextEditingController _storeNameController;
  late final TextEditingController _storeAddressController;
  late final TextEditingController _storeTaxIdController;
  late final TextEditingController _storePhoneController;
  late final TextEditingController _receiptFooterController;
  late final TextEditingController _lowStockThresholdController;

  @override
  void initState() {
    super.initState();
    _storeNameController =
        TextEditingController(text: widget.profile.storeName);
    _storeAddressController =
        TextEditingController(text: widget.profile.storeAddress);
    _storeTaxIdController =
        TextEditingController(text: widget.profile.storeTaxId);
    _storePhoneController =
        TextEditingController(text: widget.profile.storePhone);
    _receiptFooterController =
        TextEditingController(text: widget.profile.receiptFooter);
    _lowStockThresholdController = TextEditingController(
      text: widget.profile.lowStockThreshold.toString(),
    );
  }

  @override
  void didUpdateWidget(covariant _StoreProfileCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile == widget.profile) return;

    _storeNameController.text = widget.profile.storeName;
    _storeAddressController.text = widget.profile.storeAddress;
    _storeTaxIdController.text = widget.profile.storeTaxId;
    _storePhoneController.text = widget.profile.storePhone;
    _receiptFooterController.text = widget.profile.receiptFooter;
    _lowStockThresholdController.text =
        widget.profile.lowStockThreshold.toString();
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _storeAddressController.dispose();
    _storeTaxIdController.dispose();
    _storePhoneController.dispose();
    _receiptFooterController.dispose();
    _lowStockThresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(settingsControllerProvider).isLoading;

    return _SettingsCard(
      title: 'settings.store_profile'.tr(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildField(_storeNameController, 'settings.store_name'.tr()),
          const SizedBox(height: 12),
          _buildField(
            _storeAddressController,
            'settings.store_address'.tr(),
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          _buildField(_storeTaxIdController, 'settings.store_tax_id'.tr()),
          const SizedBox(height: 12),
          _buildField(_storePhoneController, 'settings.store_phone'.tr()),
          const SizedBox(height: 12),
          _buildField(
            _receiptFooterController,
            'settings.receipt_footer'.tr(),
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          _buildField(
            _lowStockThresholdController,
            'settings.low_stock_threshold'.tr(),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: isSaving ? null : _saveProfile,
              icon: const Icon(Icons.save_outlined),
              label: Text('settings.save_profile'.tr()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
    );
  }

  Future<void> _saveProfile() async {
    final threshold = int.tryParse(_lowStockThresholdController.text.trim()) ??
        widget.profile.lowStockThreshold;
    final profile = StoreProfile(
      storeName: _storeNameController.text.trim(),
      storeAddress: _storeAddressController.text.trim(),
      storeTaxId: _storeTaxIdController.text.trim(),
      storePhone: _storePhoneController.text.trim(),
      receiptFooter: _receiptFooterController.text.trim(),
      lowStockThreshold: threshold < 1 ? 1 : threshold,
    );

    await ref
        .read(settingsControllerProvider.notifier)
        .saveStoreProfile(profile);
    ref.invalidate(lowStockCountProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('settings.save_profile_success'.tr())),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(label)),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _AsyncInfoRow<T> extends StatelessWidget {
  const _AsyncInfoRow({
    required this.label,
    required this.asyncValue,
    required this.valueBuilder,
  });

  final String label;
  final AsyncValue<T> asyncValue;
  final String Function(T data) valueBuilder;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: (data) => _InfoRow(label: label, value: valueBuilder(data)),
      loading: () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            const SizedBox(height: 8),
            const AppLoadingState(compact: true),
          ],
        ),
      ),
      error: (error, _) => AppErrorState(
        message: error.toString(),
        compact: true,
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return _SettingsCard(
      title: 'settings.store_profile'.tr(),
      child: SizedBox(
        height: 180,
        child: const AppLoadingState(),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return _SettingsCard(
      title: 'settings.store_profile'.tr(),
      child: AppErrorState(
        message: error,
        compact: true,
      ),
    );
  }
}
