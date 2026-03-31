import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../models/note_model.dart';
import 'note_card_widget.dart';

class BuildGridView extends StatelessWidget {
  final Box<NoteModel> notes;

  const BuildGridView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    final noteList = notes.values.toList();
    return MasonryGridView.count(
      itemCount: noteList.length,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: context.hg(12),
      crossAxisSpacing: context.wd(12),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NoteCardWidget(
          title: noteList[index].title,
          content: noteList[index].content,
        );
      },
    );
  }
}
