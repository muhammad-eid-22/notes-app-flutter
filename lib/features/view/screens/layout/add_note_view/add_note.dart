import 'package:flutter/material.dart';
import 'package:jotty_note_app/features/view/screens/layout/add_note_view/widget/card_note_category.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theme_manager/app_colors.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../../widget/custom_icon_botton.dart';
import '../../../widget/txt_field.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconBotton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.wd(24)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text("Title", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: context.hg(16)),
              TxtField(
                text: "Enter Note Title",
                padding: EdgeInsets.only(left: context.wd(16)),
                controller: _titleController,
              ),
              SizedBox(height: context.hg(24)),
              // Content Section
              Text("Content", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: context.hg(16)),
              Expanded(
                child: TxtField(
                  text: "Write your note here ...",
                  controller: _contentController,
                  expands: true,
                  maxLines: null,
                  isPassword: false,
                  textAlignVertical: TextAlignVertical.top,
                  padding: EdgeInsets.only(
                    left: context.wd(16),
                    top: context.hg(16),
                  ),
                ),
              ),
              SizedBox(height: context.hg(24)),
              // Button Section
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomElevatedButton(onPressed: () {}, text: "Save"),
                  ),
                  Expanded(
                    child: CustomIconBotton(
                      onTap: () {
                        // TODO: Add to favorite
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppColors.primary,
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
