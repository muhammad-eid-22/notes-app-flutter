import 'package:flutter/material.dart';
import 'package:jotty_note_app/features/view/widget/custom_icon_botton.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/theme_manager/app_colors.dart';

class TxtField extends StatefulWidget {
  final String text;
  final Color cursorColor;
  final int? maxLines;
  final bool expands;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry padding;
  final TextAlignVertical textAlignVertical;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  const TxtField({
    super.key,
    required this.text,
    this.cursorColor = AppColors.primary,
    this.maxLines = 1,
    this.expands = false,
    this.padding = EdgeInsets.zero,
    this.suffixIcon,
    this.textAlignVertical = TextAlignVertical.center,
    this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  late bool obscureText = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscureText,
      textAlignVertical: widget.textAlignVertical,
      cursorRadius: Radius.circular(context.wd(8)),
      cursorColor: widget.cursorColor,
      maxLines: widget.maxLines,
      expands: widget.expands,

      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? CustomIconBotton(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : widget.suffixIcon,

        suffixIconColor: AppColors.darkGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.wd(16)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.wd(16)),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.wd(16)),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.wd(16)),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.wd(16)),
          borderSide: BorderSide(color: AppColors.red),
        ),
        hintText: widget.text,
        hintStyle: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(color: AppColors.grey),
        contentPadding: widget.padding,
      ),
    );
  }
}
