import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/app_permission.dart';
import '../providers/access_providers.dart';

class PermissionGuard extends ConsumerWidget {
  final AppPermission permission;
  final Widget child;
  final Widget? fallback;

  const PermissionGuard({
    super.key,
    required this.permission,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPermission = ref.watch(hasPermissionProvider(permission));

    if (hasPermission) {
      return child;
    }

    return fallback ?? const SizedBox.shrink();
  }
}
