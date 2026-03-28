import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/theme_manager/app_colors.dart';
import '../../view/widget/custom_elevated_button.dart';
import '../../view/widget/custom_icon_botton.dart';
import '../../view/widget/txt_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconBotton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.wd(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: context.hg(16)),
            Text(
              "Insert your email address to receive a code for creating a new password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: context.hg(40)),
            // Email Field
            TxtField(
              text: "Enter your email",
              padding: EdgeInsets.only(left: context.wd(16)),
            ),
            SizedBox(height: context.hg(24)),
            //   send code Button
            CustomElevatedButton(text: "Send Code", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
