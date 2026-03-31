import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jotty_note_app/core/router/page_route_name.dart';
import 'core/router/app_router.dart';
import 'core/theme_manager/app_theme.dart';
import 'features/models/note_model.dart';
import 'features/models/note_model_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>("Notes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jotty',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      initialRoute: PageRouteName.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
