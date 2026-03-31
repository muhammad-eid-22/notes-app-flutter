import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jotty_note_app/core/extensions/context_extensions.dart';
import 'package:jotty_note_app/features/view/screens/layout/home_view/widget/bulid_grid_view.dart';
import 'package:jotty_note_app/features/view/screens/layout/home_view/widget/bulid_list_view.dart';
import '../../../../../core/theme_manager/app_colors.dart';
import '../../../../models/note_model.dart';
import '../../../widget/custom_icon_botton.dart';
import 'widget/custom_app_bar.dart';
import 'widget/empty_notes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  bool isGrid = false;
  var box = Hive.box<NoteModel>("Notes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          isGrid: isGrid,
          onToggleView: () {
            setState(() {
              isGrid = !isGrid;
            });
          },
        ),
      ),

      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          if (box.isEmpty) {
            return EmptyNotes();
          }
          return Padding(
            padding: EdgeInsets.all(context.wd(16)),
            child: SingleChildScrollView(
              child: Column(
                spacing: context.hg(16),
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    spacing: context.wd(16),
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconBotton(
                        onTap: () {
                          setState(() {
                            isGrid = !isGrid;
                          });
                        },
                        icon: Icon(
                          isGrid ? Icons.view_list_rounded : Icons.grid_view,
                          color: AppColors.primary,
                        ),
                      ),
                      CustomIconBotton(
                        onTap: () {},
                        icon: Icon(
                          Icons.filter_list_alt,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  isGrid
                      ? BuildGridView(notes: box)
                      : BuildListView(notes: box),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void addNote(note) {
    print("BOX LENGTH = ${box.length}");
    print("VALUES = ${box.values.toList()}");
    setState(() {
      box.add(note);
    });
  }
}
