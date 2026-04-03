import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/orders/presentation/pages/order_history_page.dart';
import '../../features/pos/presentation/pages/pos_page.dart';
import '../../features/receipt/presentation/pages/receipt_preview_page.dart';
import '../../features/settings/presentation/pages/menu_management_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/printer/presentation/screens/printer_settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/',
      name: 'pos',
      builder: (context, state) => const PosPage(),
    ),
    GoRoute(
      path: '/checkout',
      name: 'checkout',
      builder: (context, state) => const CheckoutPage(),
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const OrderHistoryPage(),
    ),
    GoRoute(
      path: '/inventory',
      name: 'inventory',
      builder: (context, state) => const InventoryPage(),
    ),
    GoRoute(
      path: '/receipt/:orderId',
      name: 'receipt',
      builder: (context, state) {
        final orderId = int.tryParse(state.pathParameters['orderId'] ?? '');
        if (orderId == null) {
          return const OrderHistoryPage();
        }

        return ReceiptPreviewPage(orderId: orderId);
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
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
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
