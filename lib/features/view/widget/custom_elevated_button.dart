import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme_manager/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double radius;
  final String text;
  final Widget? icon;
  final bool isFilled;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    this.radius = 24,
    required this.text,
    this.icon,
    this.isFilled = true,
    required this.onPressed,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.transparent,

        backgroundColor: isFilled ? AppColors.primary : AppColors.transparent,
        elevation: isFilled ? context.wd(2) : 0,
        side: BorderSide(color: borderColor!, width: context.wd(1.5)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        iconColor: AppColors.primary,
        iconSize: context.wd(24),
        padding: EdgeInsets.all(context.wd(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: context.wd(8),
        children: [
          icon != null ? icon! : SizedBox(),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
