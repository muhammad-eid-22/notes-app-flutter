import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/theme_manager/app_colors.dart';
import 'package:jotty_note_app/features/view/widget/custom_icon_botton.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/router/page_route_name.dart';
import '../../../widget/custom_elevated_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconBotton(
          onTap: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
        ),
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.wd(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.hg(24),
          children: [
            // Info
            Row(
              spacing: context.wd(16),
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Assets.images.engMohamed.image(fit: BoxFit.cover),
                  ),
                ),
                Column(
                  spacing: context.hg(4),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Eid",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Row(
                      spacing: context.wd(8),
                      children: [
                        Assets.icons.email.svg(
                          width: context.wd(14),
                          height: context.hg(12),
                          colorFilter: const ColorFilter.mode(
                            AppColors.darkGrey,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "MohamedEid@gmail.com",
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.darkGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Edit Profile
            CustomElevatedButton(
              text: "Edit Profile",
              icon: Assets.icons.edit.svg(),
              isFilled: false,
              textColor: AppColors.primary,
              borderColor: AppColors.primary,
              onPressed: () {},
            ),
            Divider(),
            // Options
            Text(
              "App Settings",
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColors.darkGrey),
            ),
            Column(
              spacing: context.hg(36),
              children: [
                // change password
                Row(
                  spacing: context.wd(16),
                  children: [
                    Assets.icons.lock.svg(),
                    Text(
                      "Change Password",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    CustomIconBotton(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageRouteName.changePassword,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
                // language
                Row(
                  spacing: context.wd(16),
                  children: [
                    Assets.icons.language.svg(),
                    Text(
                      "Language",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),

                    /// To Do create a language widget
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.primary,
                      child: Text(
                        "EN",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                // Notification
                Row(
                  spacing: context.wd(16),
                  children: [
                    Assets.icons.notification.svg(),
                    Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    Text(
                      "All Active",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              spacing: context.wd(16),
              children: [
                Assets.icons.logout.svg(),
                Text(
                  "Log Out",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                "Jotty Version 1.0.0",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.darkGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
