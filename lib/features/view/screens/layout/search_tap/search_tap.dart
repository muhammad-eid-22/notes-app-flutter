import 'package:flutter/material.dart';
import 'package:jotty_note_app/features/view/widget/txt_field.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theme_manager/app_colors.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(context.wd(16)),
        child: Column(
          children: [
            TxtField(
              text: "Search For Notes",
              padding: EdgeInsets.only(left: context.wd(16)),
              suffixIcon: Icon(Icons.search),
              cursorColor: AppColors.primary,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
