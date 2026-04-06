import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/bootstrap.dart';
import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/l10n/localization.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../../app/mode/business_mode_registry.dart';
import '../../../../app/mode/current_mode_provider.dart';
import '../../../../app/router/app_router.dart';
import '../../domain/entities/store_profile.dart';
import '../providers/settings_providers.dart';
import '../../../orders/presentation/providers/order_history_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../pos/presentation/providers/cart_provider.dart';
import '../../../pos/presentation/providers/pos_providers.dart';
import '../../../../app/services/backup_service.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_permission.dart';
import 'package:thai_pos_demo/shared/presentation/widgets/permission_guard.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWebPersistenceMode = isar == null && sharedPreferences != null;
    final categoryCountAsync = ref.watch(categoryCountProvider);
    final productCountAsync = ref.watch(productCountProvider);
    final ordersAsync = ref.watch(ordersProvider);
    final orderCountAsync = ref.watch(orderCountProvider);
    final lowStockCountAsync = ref.watch(lowStockCountProvider);
    final storeProfileAsync = ref.watch(storeProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'settings.logout_title'.tr(),
            onPressed: () async {
              final authState = ref.read(authNotifierProvider);
              final isAdmin = authState.value == 'admin';

              if (isAdmin) {
                ref.read(authNotifierProvider.notifier).logout();
                if (context.mounted) context.go('/login');
                return;
              }

              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('settings.logout_title'.tr()),
                  content: Text('settings.logout_confirm'.tr()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('common.cancel'.tr()),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('settings.logout_title'.tr()),
                    ),
                  ],
                ),
              );

              if (confirmed == true && context.mounted) {
                ref.read(authNotifierProvider.notifier).logout();
                if (context.mounted) context.go('/login');
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final columns = responsive.settingsColumnCount;
            const gridSpacing = 16.0;
            final totalSpacing = gridSpacing * (columns - 1);
            final cardWidth = ((constraints.maxWidth - totalSpacing) / columns)
                .clamp(280.0, constraints.maxWidth);
            final contentWidth = (cardWidth * columns) + totalSpacing;

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
                          return DateFormat(
                            'dd/MM/yyyy HH:mm',
                          ).format(orders.first.createdAt.toLocal());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: const _BusinessModeCard(),
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
                  title: 'printer.title'.tr(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('printer.settings_hint'.tr()),
                      const SizedBox(height: 16),
                      PermissionGuard(
                        permission: AppPermission.printerChangeDefault,
                        child: FilledButton.icon(
                          onPressed: () => context.go('/settings/printer'),
                          icon: const Icon(Icons.bluetooth_outlined),
                          label: Text('printer.open_settings'.tr()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _SettingsCard(
                  title: 'สำรองข้อมูล (Backup)',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Text('สำรองข้อมูลและกู้คืนฐานข้อมูลของคุณ'),
                       const SizedBox(height: 16),
                       Wrap(
                         spacing: 12,
                         runSpacing: 12,
                         children: [
                            FilledButton.icon(
                               onPressed: () async {
                                  if (isar == null) return;
                                  try {
                                    final service = BackupService(isar!);
                                    await service.createBackup();
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('สำรองข้อมูลสำเร็จ')));
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ผิดพลาด: $e')));
                                    }
                                  }
                               }, 
                               icon: const Icon(Icons.download), 
                               label: const Text('สำรองข้อมูล ตอนนี้'),
                            ),
                            FilledButton.tonalIcon(
                               onPressed: null, // Placeholder
                               icon: const Icon(Icons.upload), 
                               label: const Text('กู้คืนข้อมูล'),
                            ),
                         ],
                       ),
                    ],
                  ),
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
                      if (isWebPersistenceMode) ...[
                        Text('settings.reset_web_demo_data_hint'.tr()),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: () =>
                              _confirmResetWebDemoData(context, ref),
                          icon: const Icon(Icons.restart_alt_rounded),
                          label: Text('settings.reset_web_demo_data'.tr()),
                        ),
                        const SizedBox(height: 16),
                      ],
                      orderCountAsync.when(
                        data: (count) => Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            PermissionGuard(
                              permission: AppPermission.transactionVoid,
                              child: FilledButton.icon(
                                onPressed: count == 0 || isar == null
                                    ? null
                                    : () => _confirmClearOrders(context, ref),
                                icon: const Icon(Icons.delete_sweep_outlined),
                                label: Text('settings.clear_orders'.tr()),
                              ),
                            ),
                            PermissionGuard(
                              permission: AppPermission.settingsEdit,
                              child: OutlinedButton.icon(
                                onPressed: () => context.go('/menu-management'),
                                icon: const Icon(
                                  Icons.restaurant_menu_outlined,
                                ),
                                label: Text('menu.title'.tr()),
                              ),
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
                            PermissionGuard(
                              permission: AppPermission.settingsEdit,
                              child: OutlinedButton.icon(
                                onPressed: () => context.go('/settings/audit-log'),
                                icon: const Icon(Icons.security_outlined),
                                label: Text('settings.audit_log'.tr()),
                              ),
                            ),
                            PermissionGuard(
                              permission: AppPermission.settingsEdit,
                              child: OutlinedButton.icon(
                                onPressed: () => context.go('/settings/job-queue'),
                                icon: const Icon(Icons.queue_play_next_outlined),
                                label: Text('settings.job_queue'.tr()),
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => context.go('/settings/feature-showcase'),
                              icon: const Icon(Icons.view_carousel_outlined),
                              label: Text('demo.title'.tr()),
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
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentWidth),
                  child: Wrap(
                    spacing: gridSpacing,
                    runSpacing: gridSpacing,
                    children: cards,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _confirmClearOrders(BuildContext context, WidgetRef ref) async {
    final confirmed =
        await showDialog<bool>(
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

  Future<void> _confirmResetWebDemoData(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('settings.confirm_reset_web_title'.tr()),
              content: Text('settings.confirm_reset_web_message'.tr()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('common.cancel'.tr()),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('settings.confirm_reset_web_action'.tr()),
                ),
              ],
            );
          },
        ) ??
        false;

    if (!confirmed || sharedPreferences == null) return;

    await Future.wait([
      sharedPreferences!.remove('web_categories_v1'),
      sharedPreferences!.remove('web_products_v1'),
      sharedPreferences!.remove('web_store_name_v1'),
      sharedPreferences!.remove('web_store_address_v1'),
      sharedPreferences!.remove('web_store_tax_id_v1'),
      sharedPreferences!.remove('web_store_phone_v1'),
      sharedPreferences!.remove('web_receipt_footer_v1'),
      sharedPreferences!.remove('web_low_stock_threshold_v1'),
      sharedPreferences!.remove('web_orders_v1'),
      sharedPreferences!.remove('web_cart_draft_v1'),
    ]);

    ref.read(selectedCategoryIdProvider.notifier).select(null);
    ref.read(cartProvider.notifier).clearCart();
    ref.invalidate(categoriesProvider);
    ref.invalidate(productsProvider);
    ref.invalidate(inventoryProductsProvider);
    ref.invalidate(productCountProvider);
    ref.invalidate(lowStockCountProvider);
    ref.invalidate(storeProfileProvider);
    ref.invalidate(lowStockThresholdProvider);
    ref.invalidate(ordersProvider);
    ref.invalidate(orderCountProvider);

    if (!context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('settings.reset_web_success'.tr())));
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
    _storeNameController = TextEditingController(
      text: widget.profile.storeName,
    );
    _storeAddressController = TextEditingController(
      text: widget.profile.storeAddress,
    );
    _storeTaxIdController = TextEditingController(
      text: widget.profile.storeTaxId,
    );
    _storePhoneController = TextEditingController(
      text: widget.profile.storePhone,
    );
    _receiptFooterController = TextEditingController(
      text: widget.profile.receiptFooter,
    );
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
    _lowStockThresholdController.text = widget.profile.lowStockThreshold
        .toString();
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
            child: PermissionGuard(
              permission: AppPermission.settingsEdit,
              fallback: Center(child: Text('common.no_permission'.tr(), style: const TextStyle(fontSize: 12))),
              child: FilledButton.icon(
                onPressed: isSaving ? null : _saveProfile,
                icon: const Icon(Icons.save_outlined),
                label: Text('settings.save_profile'.tr()),
              ),
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
    final threshold =
        int.tryParse(_lowStockThresholdController.text.trim()) ??
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
    
    // The controller handles status (success/error state)
    final state = ref.read(settingsControllerProvider);
    if (state.hasError) {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(state.error.toString()), backgroundColor: Theme.of(context).colorScheme.error),
       );
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('settings.save_profile_success'.tr())),
       );
    }
  }
}

class _BusinessModeCard extends ConsumerWidget {
  const _BusinessModeCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(appProfileNotifierProvider);
    final registry = ref.watch(businessModeRegistryProvider);

    return _SettingsCard(
      title: 'settings.business_mode'.tr(),
      child: profileAsync.when(
        data: (profile) => Column(
          children: registry.values.map((definition) {
            final isActive = profile.activeModeId == definition.id;
            return Card(
              elevation: isActive ? 4 : 0,
              color: isActive
                  ? Theme.of(context).colorScheme.primaryContainer.withAlpha(50)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outlineVariant,
                  width: isActive ? 2 : 1,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: isActive ? null : () => _switchMode(context, ref, definition.id),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        definition.id == 'retail' 
                            ? Icons.storefront_outlined 
                            : Icons.restaurant_menu_outlined,
                        color: isActive ? Theme.of(context).colorScheme.primary : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              definition.displayName,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: isActive ? FontWeight.bold : null,
                                color: isActive ? Theme.of(context).colorScheme.primary : null,
                              ),
                            ),
                            Text(
                              definition.id == 'retail'
                                  ? 'settings.business_mode_retail_desc'.tr()
                                  : 'settings.business_mode_restaurant_desc'.tr(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      if (isActive)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'settings.business_mode_active'.tr(),
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        loading: () => const AppLoadingState(compact: true),
        error: (error, _) => Text(error.toString()),
      ),
    );
  }

  Future<void> _switchMode(BuildContext context, WidgetRef ref, String modeId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('settings.business_mode'.tr()),
        content: Text('settings.business_mode_switch_confirm'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('common.cancel'.tr()),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('common.confirm'.tr()),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(appProfileNotifierProvider.notifier).updateMode(modeId);
      // Invalidate the router provider to force a full navigation rebind
      ref.invalidate(appRouterProvider);
    }
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.title, required this.child});

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
  const _InfoRow({required this.label, required this.value});

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
          Flexible(child: Text(value, textAlign: TextAlign.right)),
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
      error: (error, _) =>
          AppErrorState(message: error.toString(), compact: true),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return _SettingsCard(
      title: 'settings.store_profile'.tr(),
      child: SizedBox(height: 180, child: const AppLoadingState()),
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
      child: AppErrorState(message: error, compact: true),
    );
  }
}
