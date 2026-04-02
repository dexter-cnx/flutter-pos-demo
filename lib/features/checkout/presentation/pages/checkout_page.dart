import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../app/layout/responsive_layout.dart';
import '../../../../app/widgets/async_state_view.dart';
import '../../../orders/presentation/providers/order_history_provider.dart';
import '../../../pos/presentation/providers/cart_provider.dart';
import '../../../pos/presentation/providers/pos_providers.dart';
import '../../../settings/domain/entities/store_profile.dart';
import '../../../settings/presentation/providers/settings_providers.dart';
import '../providers/checkout_providers.dart';
import '../services/promptpay_qr_service.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  late final TextEditingController _receivedController;

  @override
  void initState() {
    super.initState();
    _receivedController = TextEditingController();
  }

  @override
  void dispose() {
    _receivedController.dispose();
    super.dispose();
  }

  void _onReceivedChanged(String value) {
    final parsed = double.tryParse(value.replaceAll(',', '')) ?? 0;
    ref.read(cashReceivedProvider.notifier).state = parsed;
  }

  String _editableCurrency(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }
    return value.toStringAsFixed(2);
  }

  void _setReceivedAmount(double value) {
    final safeValue = value < 0 ? 0.0 : value;
    final text = _editableCurrency(safeValue);
    ref.read(cashReceivedProvider.notifier).state = safeValue;
    _receivedController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  void _addReceivedAmount(double amount) {
    final current = ref.read(cashReceivedProvider);
    _setReceivedAmount(current + amount);
  }

  void _resetSimulationState() {
    ref.read(paymentSimulationStateProvider.notifier).state =
        PaymentSimulationState.idle;
  }

  Future<void> _simulateCardApproval() async {
    ref.read(paymentSimulationStateProvider.notifier).state =
        PaymentSimulationState.processing;
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    ref.read(paymentSimulationStateProvider.notifier).state =
        PaymentSimulationState.approved;
  }

  void _markQrAsPaid() {
    ref.read(paymentSimulationStateProvider.notifier).state =
        PaymentSimulationState.approved;
  }

  Future<void> _copyReference(BuildContext context, String reference) async {
    await Clipboard.setData(ClipboardData(text: reference));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('checkout.copy_success'.tr())));
  }

  Future<void> _confirmPayment(
    BuildContext context,
    CartState cartState,
    PaymentMethod method,
    double receivedAmount,
    double change,
  ) async {
    if (cartState.items.isEmpty) return;

    final effectiveReceivedAmount = method == PaymentMethod.cash
        ? receivedAmount
        : cartState.total;
    final orderId = await ref
        .read(orderHistoryProvider.notifier)
        .saveOrder(
          cartState: cartState,
          method: method,
          receivedAmount: effectiveReceivedAmount,
          changeAmount: change,
        );
    await ref.read(inventoryActionsProvider.notifier).deductStock({
      for (final item in cartState.items) item.product.id: item.quantity,
    });
    if (!context.mounted) return;

    ref.read(cartProvider.notifier).clearCart();
    ref.read(cashReceivedProvider.notifier).state = 0;
    _resetSimulationState();
    _receivedController.clear();

    if (orderId != null) {
      context.go('/receipt/$orderId');
      return;
    }

    context.go('/');
  }

  String _paymentLabel(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cash:
        return 'payment.cash'.tr();
      case PaymentMethod.qr:
        return 'payment.qr'.tr();
      case PaymentMethod.card:
        return 'payment.card'.tr();
    }
  }

  String _currency(double value) => '\u0E3F${value.toStringAsFixed(2)}';

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    bool bold = false,
  }) {
    final baseStyle =
        Theme.of(context).textTheme.titleMedium ?? const TextStyle();
    final style = baseStyle.copyWith(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: bold ? 18 : baseStyle.fontSize,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);
    final method = ref.watch(selectedPaymentMethodProvider);
    final receivedAmount = ref.watch(cashReceivedProvider);
    final storeProfileAsync = ref.watch(storeProfileProvider);
    final simulationState = ref.watch(paymentSimulationStateProvider);
    final amountDue = cartState.total;
    final effectiveReceivedAmount = method == PaymentMethod.cash
        ? receivedAmount
        : amountDue;
    final change = method == PaymentMethod.cash
        ? max(0.0, receivedAmount - amountDue)
        : 0.0;
    final hasItems = cartState.items.isNotEmpty;
    final hasEnteredCash = method != PaymentMethod.cash || receivedAmount > 0;
    final hasSufficientCash =
        method != PaymentMethod.cash || receivedAmount >= amountDue;
    final hasApprovedDigitalPayment =
        method == PaymentMethod.cash ||
        simulationState == PaymentSimulationState.approved;
    final canConfirmPayment =
        hasItems &&
        hasEnteredCash &&
        hasSufficientCash &&
        hasApprovedDigitalPayment;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: Text('checkout.title'.tr()),
        actions: [
          TextButton(
            onPressed: () => context.go('/'),
            child: Text('common.back'.tr()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final summary = _buildOrderSummary(context, cartState);
            final paymentPanel = _buildPaymentPanel(
              context,
              canConfirmPayment,
              method,
              amountDue,
              receivedAmount,
              change,
              simulationState,
              storeProfileAsync,
              () => _confirmPayment(
                context,
                cartState,
                method,
                effectiveReceivedAmount,
                change,
              ),
            );

            if (responsive.isSplitView) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(child: summary),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(child: paymentPanel),
                  ),
                ],
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [summary, const SizedBox(height: 16), paymentPanel],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, CartState cartState) {
    final hasItems = cartState.items.isNotEmpty;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'checkout.summary'.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              if (!hasItems)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Text('checkout.empty_cart'.tr()),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: () => context.go('/'),
                        child: Text('common.back'.tr()),
                      ),
                    ],
                  ),
                )
              else
                Column(
                  children: [
                    ...cartState.items.map(
                      (item) => _buildCartItem(context, item),
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 32),
                    _buildSummaryRow(
                      context,
                      'checkout.amount_due'.tr(),
                      _currency(cartState.subtotal + cartState.taxAmount),
                      bold: true,
                    ),
                    _buildSummaryRow(
                      context,
                      '${'pos.vat'.tr()} (7%)',
                      _currency(cartState.taxAmount),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.name, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  '${item.quantity} x ${_currency(item.product.price)}',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Text(_currency(item.product.price * item.quantity)),
        ],
      ),
    );
  }

  Widget _buildPaymentPanel(
    BuildContext context,
    bool enabled,
    PaymentMethod method,
    double amountDue,
    double receivedAmount,
    double change,
    PaymentSimulationState simulationState,
    AsyncValue<StoreProfile> storeProfileAsync,
    VoidCallback onConfirm,
  ) {
    final isCash = method == PaymentMethod.cash;
    final isQr = method == PaymentMethod.qr;
    final isCard = method == PaymentMethod.card;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'payment.title'.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                'checkout.payment_method'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: PaymentMethod.values.map((candidate) {
                  return ChoiceChip(
                    label: Text(_paymentLabel(candidate)),
                    selected: candidate == method,
                    onSelected: (_) {
                      ref.read(selectedPaymentMethodProvider.notifier).state =
                          candidate;
                      _resetSimulationState();
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (isCash) ...[
                TextField(
                  controller: _receivedController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'checkout.enter_received'.tr(),
                    prefixText: '\u0E3F',
                  ),
                  onChanged: _onReceivedChanged,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    OutlinedButton(
                      onPressed: () => _setReceivedAmount(amountDue),
                      child: Text('checkout.exact_amount'.tr()),
                    ),
                    for (final amount in const [10, 100, 500, 1000])
                      OutlinedButton(
                        onPressed: () => _addReceivedAmount(amount.toDouble()),
                        child: Text(
                          'checkout.add_cash_amount'.tr(args: ['$amount']),
                        ),
                      ),
                  ],
                ),
                if (receivedAmount > 0 && receivedAmount < amountDue) ...[
                  const SizedBox(height: 12),
                  Text(
                    'checkout.insufficient_cash'.tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ] else if (isQr) ...[
                storeProfileAsync.when(
                  data: (profile) => _buildPromptPaySection(
                    context,
                    profile,
                    amountDue,
                    simulationState,
                  ),
                  loading: () => const AppLoadingState(compact: true),
                  error: (error, _) => AppErrorState(
                    message: error.toString(),
                    compact: true,
                    onRetry: () => ref.invalidate(storeProfileProvider),
                  ),
                ),
              ] else if (isCard) ...[
                _buildCardSection(context, simulationState),
              ],
              const SizedBox(height: 16),
              _buildSummaryRow(
                context,
                'checkout.amount_due'.tr(),
                _currency(amountDue),
              ),
              _buildSummaryRow(
                context,
                'payment.change'.tr(),
                _currency(change),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: enabled ? onConfirm : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      isCash ? 'payment.confirm'.tr() : 'common.pay'.tr(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromptPaySection(
    BuildContext context,
    StoreProfile storeProfile,
    double amountDue,
    PaymentSimulationState simulationState,
  ) {
    final qrData = PromptPayQrService.build(
      storeName: storeProfile.storeName,
      taxId: storeProfile.storeTaxId,
      phone: storeProfile.storePhone,
      amount: amountDue,
    );
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'checkout.promptpay_ready'.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'checkout.promptpay_hint'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: QrImageView(
                  data: qrData.payload,
                  version: QrVersions.auto,
                  size: 220,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow(
            context,
            'checkout.promptpay_amount'.tr(),
            _currency(amountDue),
          ),
          _buildSummaryRow(
            context,
            'checkout.promptpay_merchant'.tr(),
            storeProfile.storeName,
          ),
          _buildSummaryRow(
            context,
            'checkout.promptpay_receiver'.tr(),
            qrData.receiverLabel,
          ),
          _buildSummaryRow(
            context,
            'checkout.promptpay_reference'.tr(),
            qrData.reference,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: () => _copyReference(context, qrData.reference),
                icon: const Icon(Icons.copy_outlined),
                label: Text('checkout.copy_reference'.tr()),
              ),
              FilledButton.icon(
                onPressed: simulationState == PaymentSimulationState.approved
                    ? null
                    : _markQrAsPaid,
                icon: Icon(
                  simulationState == PaymentSimulationState.approved
                      ? Icons.check_circle_outline
                      : Icons.qr_code_2_rounded,
                ),
                label: Text('checkout.qr_mark_paid'.tr()),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSimulationStatus(
            context,
            simulationState,
            idleText: 'checkout.qr_waiting'.tr(),
            processingText: 'checkout.qr_waiting'.tr(),
            approvedText: 'checkout.qr_success'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection(
    BuildContext context,
    PaymentSimulationState simulationState,
  ) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'checkout.card_ready'.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'checkout.card_hint'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          _buildSimulationStatus(
            context,
            simulationState,
            idleText: 'checkout.card_ready'.tr(),
            processingText: 'checkout.card_processing'.tr(),
            approvedText: 'checkout.card_success'.tr(),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed:
                simulationState == PaymentSimulationState.processing ||
                    simulationState == PaymentSimulationState.approved
                ? null
                : _simulateCardApproval,
            icon: Icon(
              simulationState == PaymentSimulationState.approved
                  ? Icons.check_circle_outline
                  : Icons.credit_card,
            ),
            label: Text('checkout.card_simulate'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildSimulationStatus(
    BuildContext context,
    PaymentSimulationState simulationState, {
    required String idleText,
    required String processingText,
    required String approvedText,
  }) {
    final theme = Theme.of(context);
    late final IconData icon;
    late final String text;
    late final Color color;

    switch (simulationState) {
      case PaymentSimulationState.idle:
        icon = Icons.schedule_outlined;
        text = idleText;
        color = theme.colorScheme.secondary;
        break;
      case PaymentSimulationState.processing:
        icon = Icons.sync_rounded;
        text = processingText;
        color = theme.colorScheme.tertiary;
        break;
      case PaymentSimulationState.approved:
        icon = Icons.verified_rounded;
        text = approvedText;
        color = Colors.green;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'checkout.payment_status'.tr(),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
