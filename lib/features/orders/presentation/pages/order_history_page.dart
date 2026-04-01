import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/widgets/async_state_view.dart';
import '../../data/models/order_model.dart';
import '../providers/order_history_provider.dart';

class OrderHistoryPage extends ConsumerWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('history.title'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ordersAsync.when(
        data: (orders) => orders.isEmpty
            ? _EmptyState(onBack: () => context.go('/'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: orders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) =>
                    _OrderCard(order: orders[index]),
              ),
        loading: () => const AppLoadingState(),
        error: (error, _) => AppErrorState(
          message: error.toString(),
          onRetry: () => ref.invalidate(ordersProvider),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.receipt_long_outlined,
      title: 'history.empty'.tr(),
      message: 'history.empty_hint'.tr(),
      actionLabel: 'common.back'.tr(),
      onAction: onBack,
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final OrderModel order;

  String _currency(double value) => '\u0E3F${value.toStringAsFixed(2)}';

  String _paymentLabel(BuildContext context) {
    switch (order.paymentMethod) {
      case 'cash':
        return 'payment.cash'.tr();
      case 'qr':
        return 'payment.qr'.tr();
      case 'card':
        return 'payment.card'.tr();
      default:
        return order.paymentMethod;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.go('/receipt/${order.id}'),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat('dd/MM/yyyy HH:mm')
                          .format(order.createdAt.toLocal()),
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Chip(label: Text(_paymentLabel(context))),
                ],
              ),
              const SizedBox(height: 12),
              ...order.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('${item.productName} x${item.quantity}'),
                      ),
                      Text(_currency(item.lineTotal)),
                    ],
                  ),
                ),
              ),
              const Divider(height: 24),
              _SummaryRow(
                label: 'pos.subtotal'.tr(),
                value: _currency(order.subtotal),
              ),
              _SummaryRow(
                label: '${'pos.vat'.tr()} (7%)',
                value: _currency(order.taxAmount),
              ),
              _SummaryRow(
                label: 'pos.total'.tr(),
                value: _currency(order.total),
                isBold: true,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  onPressed: () => context.go('/receipt/${order.id}'),
                  icon: const Icon(Icons.receipt_long_outlined),
                  label: Text('receipt.view'.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  final String label;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}
