import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './app_nav_item.dart';

/// The top-level layout for the application, providing a persistent navigation
/// sidebar or bottom bar across multiple pages.
class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  static const List<AppNavItem> _navItems = [
    AppNavItem(
      label: 'pos.nav.home',
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard,
      location: '/home',
    ),
    AppNavItem(
      label: 'pos.nav.sale',
      icon: Icons.point_of_sale_outlined,
      selectedIcon: Icons.point_of_sale,
      location: '/',
    ),
    AppNavItem(
      label: 'pos.nav.history',
      icon: Icons.history_outlined,
      selectedIcon: Icons.history,
      location: '/history',
    ),
    AppNavItem(
      label: 'pos.nav.inventory',
      icon: Icons.inventory_2_outlined,
      selectedIcon: Icons.inventory_2,
      location: '/inventory',
    ),
    AppNavItem(
      label: 'pos.nav.settings',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      location: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSidebar = constraints.maxWidth >= 600;

        if (isSidebar) {
          // TABLET/DESKTOP: Sidebar Navigation
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: constraints.maxWidth >= 900,
                  backgroundColor: colorScheme.surfaceContainerHighest.withOpacity(0.3),
                  selectedIndex: _getSelectedIndex(),
                  onDestinationSelected: (index) =>
                      _onDestinationSelected(context, index),
                  labelType: constraints.maxWidth >= 900
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.all,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CircleAvatar(
                      backgroundColor: colorScheme.primary,
                      radius: 20,
                      child: Icon(Icons.store, color: colorScheme.onPrimary),
                    ),
                  ),
                  destinations: _navItems.map((item) {
                    return NavigationRailDestination(
                      icon: Icon(item.icon),
                      selectedIcon: Icon(item.selectedIcon),
                      label: Text(item.label.tr()),
                    );
                  }).toList(),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: child),
              ],
            ),
          );
        }

        // MOBILE: Bottom Navigation
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: _getSelectedIndex(),
            onDestinationSelected: (index) =>
                _onDestinationSelected(context, index),
            destinations: _navItems.take(4).map((item) {
              return NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.selectedIcon),
                label: item.label.tr(),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  int _getSelectedIndex() {
    final index = _navItems.indexWhere((item) => location.startsWith(item.location));
    return index == -1 ? 0 : index;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    context.go(_navItems[index].location);
  }
}
