import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../models/note_model.dart';
import 'note_card_widget.dart';

class BuildListView extends StatelessWidget {
  final Box<NoteModel> notes;

  const BuildListView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    final noteList = notes.values.toList();
    return ListView.separated(
      itemBuilder: (context, index) {
        final note = noteList[index];
        return NoteCardWidget(title: note.title, content: note.content);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: context.hg(16));
      },
      itemCount: noteList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
