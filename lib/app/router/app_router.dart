import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/orders/presentation/pages/order_history_page.dart';
import '../../features/pos/presentation/pages/pos_page.dart';
import '../../features/receipt/presentation/pages/receipt_preview_page.dart';

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
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
