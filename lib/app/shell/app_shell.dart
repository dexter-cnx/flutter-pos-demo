import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../mode/current_mode_provider.dart';
import './app_nav_item.dart';

/// The top-level layout for the application, providing a persistent navigation
/// sidebar or bottom bar across multiple pages.
class AppShell extends ConsumerWidget {
  const AppShell({
    super.key,
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final definition = ref.watch(currentModeDefinitionProvider);
    final navItems = definition.navItems;

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
                  backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  selectedIndex: _getSelectedIndex(navItems),
                  onDestinationSelected: (index) =>
                      _onDestinationSelected(context, navItems, index),
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
                  destinations: navItems.map((item) {
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
            selectedIndex: _getSelectedIndex(navItems),
            onDestinationSelected: (index) =>
                _onDestinationSelected(context, navItems, index),
            destinations: navItems.map((item) {
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

  int _getSelectedIndex(List<AppNavItem> navItems) {
    final index = navItems.indexWhere((item) => location.startsWith(item.location));
    return index == -1 ? 0 : index;
  }

  void _onDestinationSelected(BuildContext context, List<AppNavItem> navItems, int index) {
    context.go(navItems[index].location);
  }
}
