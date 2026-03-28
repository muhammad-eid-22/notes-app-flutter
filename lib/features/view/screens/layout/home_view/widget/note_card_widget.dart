import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/theme_manager/app_colors.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.wd(16),
      children: [
        Bounceable(
          child: Container(
            padding: EdgeInsets.all(context.wd(16)),
            width: context.wd(170),
            height: context.hg(250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.wd(16)),
              color: AppColors.greenNote,
            ),
            child: Column(
              spacing: context.hg(8),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "💡 New Product Idea Design",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //   Discerption
                Text(
                  "Create a mobile app UI Kit that provide a basic notes functionality but with some improvement. There will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs.",
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
