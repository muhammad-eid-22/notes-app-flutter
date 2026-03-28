import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/router/page_route_name.dart';

import 'core/router/app_router.dart';
import 'core/theme_manager/app_theme.dart';

void main() {
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
