import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';
import '../../domain/repositories/audit_repository.dart';
import '../../domain/services/audit_service.dart';
import '../../data/repositories/audit_repository_impl.dart';

part 'audit_providers.g.dart';

@Riverpod(keepAlive: true)
AuditRepository auditRepository(AuditRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  return AuditRepositoryImpl(isar);
}

@Riverpod(keepAlive: true)
AuditService auditService(AuditServiceRef ref) {
  final repository = ref.watch(auditRepositoryProvider);
  return AuditService(repository);
}

/// Global Isar instance provider
@Riverpod(keepAlive: true)
Isar isar(IsarRef ref) {
  throw UnimplementedError('Isar instance must be provided at bootstrap');
}