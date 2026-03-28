import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/theme_manager/app_colors.dart';
import '../../../../widget/custom_icon_botton.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.hg(4),
        children: [
          Text(
            'Welcome Back 💫',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.darkGrey),
          ),
          Text('Mohamed Eid '),
        ],
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wd(16)),
          child: Row(
            spacing: context.wd(16),
            children: [
              CustomIconBotton(
                onTap: () {},
                icon: Icon(Icons.wb_sunny_outlined, color: AppColors.primary),
              ),
              Bounceable(
                child: Container(
                  width: context.wd(30),
                  height: context.hg(30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.wd(8)),
                    color: AppColors.primary,
                  ),
                  child: Text("En"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
