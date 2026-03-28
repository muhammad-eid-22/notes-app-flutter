import 'package:flutter/material.dart';
import 'package:jotty_note_app/features/view/screens/layout/add_note_view/widget/card_note_category.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theme_manager/app_colors.dart';

class SelectCategoryNote extends StatelessWidget {
  const SelectCategoryNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "What Do You Want to Notes?",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontSize: 30),
          ),
          Column(
            spacing: context.hg(24),
            children: [
              CardNoteCategory(
                title: "Interesting Idea",
                description: "Use free text area, feel free to write it all",
                icon: Icons.lightbulb_outline_rounded,
                backgroundColor: AppColors.primary,
                backgroundIcon: AppColors.primaryDark,
              ),
              CardNoteCategory(
                title: "Interesting Idea",
                description: "Use free text area, feel free to write it all",
                icon: Icons.lightbulb_outline_rounded,
                backgroundColor: AppColors.green,
                backgroundIcon: AppColors.darkGreen,
              ),
              CardNoteCategory(
                title: "Interesting Idea",
                description: "Use free text area, feel free to write it all",
                icon: Icons.lightbulb_outline_rounded,
                backgroundColor: AppColors.orange,
                backgroundIcon: AppColors.darkOrange,
              ),
              CardNoteCategory(
                title: "Interesting Idea",
                description: "Use free text area, feel free to write it all",
                icon: Icons.lightbulb_outline_rounded,
                backgroundColor: AppColors.red,
                backgroundIcon: AppColors.darkRed,
              ),
              CardNoteCategory(
                title: "Interesting Idea",
                description: "Use free text area, feel free to write it all",
                icon: Icons.lightbulb_outline_rounded,
                backgroundColor: AppColors.yellow,
                backgroundIcon: AppColors.darkYellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
