import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/receipt/presentation/pages/receipt_preview_page.dart';
import '../../features/settings/presentation/pages/menu_management_page.dart';
import '../../features/printer/presentation/screens/printer_settings_screen.dart';
import '../../features/settings/presentation/pages/audit_log_viewer_page.dart';
import '../../features/settings/presentation/pages/job_queue_viewer_page.dart';
import '../mode/current_mode_provider.dart';
import '../shell/app_shell.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final definition = ref.watch(currentModeDefinitionProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Routes WITHOUT Shell
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: '/receipt/:orderId',
        name: 'receipt',
        builder: (context, state) {
          final orderId = int.tryParse(state.pathParameters['orderId'] ?? '');
          if (orderId == null) {
            return const Scaffold(body: Center(child: Text('Invalid Order ID')));
          }
          return ReceiptPreviewPage(orderId: orderId);
        },
      ),

      // Routes WITH Shell (Navigation Rail/Bottom Bar)
      ShellRoute(
        builder: (context, state, child) => AppShell(
          location: state.uri.toString(),
          child: child,
        ),
        routes: [
          // Dynamic routes defined by the current business mode
          ...definition.buildRoutes(),

          // Shared settings/management routes that should be inside the shell
          GoRoute(
            path: '/menu-management',
            name: 'menu_management',
            builder: (context, state) => const MenuManagementPage(),
          ),
          GoRoute(
            path: '/settings/printer',
            name: 'printer_settings',
            builder: (context, state) => const PrinterSettingsScreen(),
          ),
          GoRoute(
            path: '/settings/audit-log',
            name: 'audit_log',
            builder: (context, state) => const AuditLogViewerPage(),
          ),
          GoRoute(
            path: '/settings/job-queue',
            name: 'job_queue',
            builder: (context, state) => const JobQueueViewerPage(),
          ),
        ],
      ),
    ],
  );
}
