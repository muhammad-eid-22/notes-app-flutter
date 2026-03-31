import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  // final String id;
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;

  NoteModel({required this.title, required this.content});
}
