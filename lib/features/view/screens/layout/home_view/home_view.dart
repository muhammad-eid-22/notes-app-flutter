import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/extensions/context_extensions.dart';
import 'package:jotty_note_app/features/view/screens/layout/home_view/widget/note_card_widget.dart';
import 'widget/custom_app_bar.dart';
import 'widget/empty_notes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.wd(16)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: context.hg(16),
              children: [
                SizedBox(height: context.hg(8)),
                // Notes
                // NoteCardWidget(),
                EmptyNotes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
