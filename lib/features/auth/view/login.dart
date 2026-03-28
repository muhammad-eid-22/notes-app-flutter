import 'package:bounceable/bounceable.dart';
import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/extensions/context_extensions.dart';
import 'package:jotty_note_app/core/router/page_route_name.dart';
import 'package:jotty_note_app/features/view/widget/custom_elevated_button.dart';
import 'package:jotty_note_app/features/view/widget/txt_field.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/theme_manager/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                "Let’s Login",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: context.hg(16)),
              Text(
                "And notes your idea",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                ),
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
              Align(
                alignment: Alignment.centerRight,
                child: Bounceable(
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.forgotPassword);
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.hg(24)),
              // Login Button
              CustomElevatedButton(
                text: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process login
                    Navigator.pushNamed(context, PageRouteName.layout);
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
                text: "Login with Google",
                onPressed: () {},
                isFilled: false,
                textColor: AppColors.backgroundDark,
                icon: Assets.icons.googleIcon.svg(),
              ),
              SizedBox(height: context.hg(24)),
              // Sign Up Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "Don’t have any account?",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bounceable(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.signUp);
                    },
                    child: Text(
                      "Sign Up",
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
            ],
          ),
        ),
      ),
    );
  }
}
