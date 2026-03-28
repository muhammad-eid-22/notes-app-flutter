import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/theme_manager/app_colors.dart';

class CardNoteCategory extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final Color backgroundIcon;

  const CardNoteCategory({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    required this.backgroundIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.hg(80),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: context.hg(16)),
      child: Row(
        spacing: 24,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: backgroundIcon,
            child: Icon(icon, color: AppColors.backgroundLight),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
