import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thai_pos_demo/shared/domain/entities/app_job.dart';
import 'package:thai_pos_demo/shared/domain/enums/job_type.dart';
import 'package:thai_pos_demo/shared/domain/services/job_handler.dart';
import 'package:thai_pos_demo/features/printer/presentation/providers/printer_providers.dart';
import 'package:thai_pos_demo/features/orders/presentation/providers/order_history_provider.dart';
import 'package:thai_pos_demo/features/settings/presentation/providers/settings_providers.dart';

class ReceiptReprintJobHandler implements JobHandler {
  final Ref _ref;

  ReceiptReprintJobHandler(this._ref);

  @override
  bool canHandle(AppJob job) => job.type == JobType.receiptReprint;

  @override
  Future<void> handle(AppJob job) async {
    final orderIdRaw = job.payload?['orderId'];
    if (orderIdRaw == null) {
      throw Exception('orderId is required in payload for receiptReprint job');
    }

    final orderId = int.tryParse(orderIdRaw.toString());
    if (orderId == null) {
      throw Exception('Invalid orderId format: $orderIdRaw');
    }

    final order = await _ref.read(orderReceiptProvider(orderId).future);
    if (order == null) {
      throw Exception('Order #$orderId not found');
    }

    final storeProfile = await _ref.read(storeProfileProvider.future);
    final printService = _ref.read(receiptPrintServiceProvider);

    await printService.printOrder(
      order: order,
      storeProfile: storeProfile,
      isReprint: true,
      actorId: job.actorId,
    );
  }
}
