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
import '../../../printer/presentation/providers/printer_providers.dart';
import '../../../printer/domain/entities/printer_status.dart';

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

    // Ask user whether to print — does not block navigation
    if (orderId != null && context.mounted) {
      _askPrintReceipt(context, ref, orderId);
      context.go('/receipt/$orderId');
      return;
    }

    context.go('/');
  }

  Future<void> _askPrintReceipt(
    BuildContext context,
    WidgetRef ref,
    int orderId,
  ) async {
    final status = ref.read(printerStatusNotifierProvider);
    final defaultPrinter = await ref.read(defaultPrinterProvider.future);
    final hasPrinter =
        status == PrinterStatus.connected || defaultPrinter != null;
    if (!hasPrinter || !context.mounted) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('printer.print_receipt_title'.tr()),
        content: Text('printer.print_receipt_confirm'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('common.cancel'.tr()),
          ),
          FilledButton.icon(
            icon: const Icon(Icons.print_outlined),
            label: Text('printer.print'.tr()),
            onPressed: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    try {
      final order = await ref.read(orderReceiptProvider(orderId).future);
      final storeProfile =
          await ref.read(storeProfileProvider.future);
      if (order == null) return;
      await ref.read(receiptPrintServiceProvider).printOrder(
            order: order,
            storeProfile: storeProfile,
          );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('printer.print_failed'.tr()),
      ));
    }
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

  Widget _buildKeypadButton(
    BuildContext context,
    Widget child,
    VoidCallback onPressed, {
    Color? color,
    Color? textColor,
    double? aspectRatio = 1.3,
  }) {
    final theme = Theme.of(context);
    Widget button = FilledButton.tonal(
      style: FilledButton.styleFrom(
        backgroundColor: color ?? theme.colorScheme.surfaceContainerHighest,
        foregroundColor: textColor ?? theme.colorScheme.onSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: aspectRatio != null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: onPressed,
      child: Center(
        child: DefaultTextStyle(
          style:
              theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: textColor ?? theme.colorScheme.onSurface,
              ) ??
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          child: child,
        ),
      ),
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: aspectRatio != null
            ? AspectRatio(aspectRatio: aspectRatio, child: button)
            : button,
      ),
    );
  }

  Widget _buildNumberKeypad(BuildContext context, double amountDue) {
    void onNumber(String n) {
      String current = _receivedController.text.replaceAll(',', '');
      if (current == '0' || current == '0.00' || current == '0.0') current = '';
      current += n;
      _receivedController.value = TextEditingValue(
        text: current,
        selection: TextSelection.collapsed(offset: current.length),
      );
      _onReceivedChanged(current);
    }

    void onClear() {
      _receivedController.clear();
      _onReceivedChanged('0');
    }

    void onDel() {
      String current = _receivedController.text.replaceAll(',', '');
      if (current.isNotEmpty) {
        current = current.substring(0, current.length - 1);
        if (current.isEmpty) {
          _receivedController.clear();
          _onReceivedChanged('0');
        } else {
          _receivedController.value = TextEditingValue(
            text: current,
            selection: TextSelection.collapsed(offset: current.length),
          );
          _onReceivedChanged(current);
        }
      }
    }

    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final onPrimary = theme.colorScheme.onPrimary;
    final secondary = theme.colorScheme.secondaryContainer;
    final onSecondary = theme.colorScheme.onSecondaryContainer;

    return Column(
      children: [
        Row(
          children: [
            _buildKeypadButton(context, const Text('7'), () => onNumber('7')),
            _buildKeypadButton(context, const Text('8'), () => onNumber('8')),
            _buildKeypadButton(context, const Text('9'), () => onNumber('9')),
            _buildKeypadButton(
              context,
              const Text('+10'),
              () => _addReceivedAmount(10),
              color: secondary,
              textColor: onSecondary,
            ),
          ],
        ),
        Row(
          children: [
            _buildKeypadButton(context, const Text('4'), () => onNumber('4')),
            _buildKeypadButton(context, const Text('5'), () => onNumber('5')),
            _buildKeypadButton(context, const Text('6'), () => onNumber('6')),
            _buildKeypadButton(
              context,
              const Text('+100'),
              () => _addReceivedAmount(100),
              color: secondary,
              textColor: onSecondary,
            ),
          ],
        ),
        Row(
          children: [
            _buildKeypadButton(context, const Text('1'), () => onNumber('1')),
            _buildKeypadButton(context, const Text('2'), () => onNumber('2')),
            _buildKeypadButton(context, const Text('3'), () => onNumber('3')),
            _buildKeypadButton(
              context,
              const Text('+500'),
              () => _addReceivedAmount(500),
              color: secondary,
              textColor: onSecondary,
            ),
          ],
        ),
        Row(
          children: [
            _buildKeypadButton(
              context,
              const Text('C'),
              onClear,
              textColor: theme.colorScheme.error,
            ),
            _buildKeypadButton(context, const Text('0'), () => onNumber('0')),
            _buildKeypadButton(
              context,
              const Icon(Icons.backspace_outlined, size: 24),
              onDel,
            ),
            _buildKeypadButton(
              context,
              const Text('+1000'),
              () => _addReceivedAmount(1000),
              color: secondary,
              textColor: onSecondary,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildKeypadButton(
              context,
              Text('checkout.exact_amount'.tr()),
              () => _setReceivedAmount(amountDue),
              color: primary,
              textColor: onPrimary,
              aspectRatio: 5.2,
            ),
          ],
        ),
      ],
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
                  readOnly: true,
                  showCursor: true,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    labelText: 'checkout.enter_received'.tr(),
                    prefixText: '\u0E3F',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withValues(alpha: 0.5),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildNumberKeypad(context, amountDue),
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
