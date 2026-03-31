import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/theme_manager/app_colors.dart';

class NoteCardWidget extends StatelessWidget {
  final String title;
  final String content;

  const NoteCardWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      child: Container(
        padding: EdgeInsets.all(context.wd(16)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.wd(16)),
          color: AppColors.greenNote,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: context.hg(8),
          children: [
            // Title
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            //   Content
            Text(content, maxLines: 8, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
