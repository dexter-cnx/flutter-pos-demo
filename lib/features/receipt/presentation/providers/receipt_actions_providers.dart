import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receipt_actions_providers.g.dart';

@riverpod
class DownloadedReceiptPath extends _$DownloadedReceiptPath {
  @override
  String? build(int orderId) => null;

  void setPath(String path) => state = path;

  void clear() => state = null;
}
