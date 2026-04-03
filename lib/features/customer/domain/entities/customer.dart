import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String id,
    required String phone,
    required String name,
    String? email,
    String? note,
    @Default(0) double points,
    @Default(0) double totalSpent,
    @Default(0) int visitCount,
    @Default('regular') String memberTier,
  }) = _Customer;
}
