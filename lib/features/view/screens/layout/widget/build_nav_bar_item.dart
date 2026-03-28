import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';

class BuildNavBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String label;
  final bool isSelected;
  final Widget activeIcon;

  const BuildNavBarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.activeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: context.hg(4),
        children: [
          isSelected ? activeIcon : icon,
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.teal : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
