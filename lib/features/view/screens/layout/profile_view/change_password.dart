import 'package:flutter/material.dart';
import 'package:jotty_note_app/features/view/widget/custom_elevated_button.dart';
import 'package:jotty_note_app/features/view/widget/custom_icon_botton.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theme_manager/app_colors.dart';
import '../../../widget/txt_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

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
        title: Text("Change Password"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(context.wd(24)),
          child: Column(
            spacing: context.hg(16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please input your current password first",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Current Password
              Text(
                "Current Password",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.backgroundDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TxtField(
                text: "************",
                padding: EdgeInsets.only(left: context.wd(24)),
                controller: passwordController,
                isPassword: true,
                maxLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: context.hg(16)),
              Text(
                "Now, create your new password",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // New Password
              Text(
                "New Password",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.backgroundDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TxtField(
                text: "************",
                padding: EdgeInsets.only(left: context.wd(24)),
                controller: passwordController,
                isPassword: true,
                maxLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              // Confirm Password
              Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.backgroundDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TxtField(
                text: "************",
                padding: EdgeInsets.only(left: context.wd(24)),
                controller: passwordController,
                isPassword: true,
                maxLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: context.hg(16)),
              CustomElevatedButton(
                text: "Submit New Password",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
