import 'package:isar/isar.dart';

import '../models/customer_model.dart';
import '../../domain/entities/customer.dart';

class IsarCustomerRepository {
  final Isar _isar;

  IsarCustomerRepository(this._isar);

  Future<List<Customer>> searchCustomers(String query) async {
    final lowerQuery = query.toLowerCase();
    
    final models = await _isar.customerModels
        .filter()
        .phoneStartsWith(query)
        .or()
        .nameContains(lowerQuery, caseSensitive: false)
        .findAll();

    return models.map(_mapToEntity).toList();
  }

  Future<Customer?> getCustomerByPhone(String phone) async {
    final model = await _isar.customerModels.where().phoneEqualTo(phone).findFirst();
    return model != null ? _mapToEntity(model) : null;
  }

  Future<void> saveCustomer(Customer customer) async {
    final model = await _isar.customerModels.where().phoneEqualTo(customer.phone).findFirst() ?? CustomerModel()
      ..phone = customer.phone
      ..createdAt = DateTime.now();

    model
      ..name = customer.name
      ..email = customer.email
      ..note = customer.note
      ..points = customer.points
      ..totalSpent = customer.totalSpent
      ..visitCount = customer.visitCount
      ..memberTier = customer.memberTier;

    await _isar.writeTxn(() async {
      await _isar.customerModels.put(model);
    });
  }

  Customer _mapToEntity(CustomerModel model) {
    return Customer(
      id: model.id.toString(),
      phone: model.phone,
      name: model.name,
      email: model.email,
      note: model.note,
      points: model.points,
      totalSpent: model.totalSpent,
      visitCount: model.visitCount,
      memberTier: model.memberTier,
    );
  }
}
