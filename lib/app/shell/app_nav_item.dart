import 'package:flutter/material.dart';

/// Represents a single navigation destination in the App Shell.
class AppNavItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String location;

  const AppNavItem({
    required this.label,
    required this.icon,
    this.selectedIcon = Icons.circle,
    required this.location,
  });
}
