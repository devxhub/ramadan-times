import 'package:flutter/material.dart';

class NamedNavigationBarItemWidget extends NavigationDestination {
  final String initialLocation;

  const NamedNavigationBarItemWidget(
      {super.key,
      required this.initialLocation,
      required Widget icon,
      required Widget? selectedIcon,
      String? label})
      : super(icon: icon, label: label ?? "", selectedIcon: selectedIcon);
}
