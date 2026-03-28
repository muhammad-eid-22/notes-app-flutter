import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/theme_manager/app_colors.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/router/page_route_name.dart';
import '../../view/widget/custom_elevated_button.dart';
import '../../view/widget/txt_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.wd(24)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: context.hg(16)),
              Text(
                "And start taking notes",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.hg(24)),
              Text("Full Name", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: context.hg(16)),
              TxtField(
                text: "Full Name",
                padding: EdgeInsets.only(left: context.wd(24)),
                controller: fullNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),
              SizedBox(height: context.hg(24)),
              Text(
                "Email Address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: context.hg(16)),
              // Input Email
              TxtField(
                text: "Example: Name@gmail.com",
                padding: EdgeInsets.only(left: context.wd(24)),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email address";
                  }
                  if (value.length < 13) {
                    return "Email must be at least 13 characters long";
                  }
                  // Email validation regex
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: context.hg(24)),
              Text("Password", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: context.hg(16)),
              // Input Password
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
              SizedBox(height: context.hg(24)),
              // Login Button
              CustomElevatedButton(
                text: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, PageRouteName.login);
                  }
                },
              ),
              SizedBox(height: context.hg(16)),
              // Or Text
              Text(
                "Or",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.hg(16)),
              // Login with Google Button
              CustomElevatedButton(
                text: "Sign Up with Google",
                onPressed: () {
                  // TODO: implement sign up with google
                },
                isFilled: false,
                textColor: AppColors.backgroundDark,
                icon: Assets.icons.googleIcon.svg(),
              ),
              SizedBox(height: context.hg(24)),
              // Already have an account
              Bounceable(
                onTap: () {
                  Navigator.pushNamed(context, PageRouteName.login);
                },
                child: Text(
                  "Already have an account? Login here",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
