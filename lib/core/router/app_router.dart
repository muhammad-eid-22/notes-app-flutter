import 'package:flutter/material.dart';
import 'package:jotty_note_app/core/router/page_route_name.dart';
import '../../features/auth/view/forgot_password.dart';
import '../../features/auth/view/login.dart';
import '../../features/auth/view/sign_up.dart';
import '../../features/view/screens/layout/add_note_view/add_note.dart';
import '../../features/view/screens/layout/home_view/home_view.dart';
import '../../features/view/screens/layout/layout_view.dart';
import '../../features/view/screens/layout/profile_view/change_password.dart';
import '../../features/view/screens/layout/profile_view/profile_view.dart';
import '../../features/view/screens/layout/search_tap/search_tap.dart';
import '../../features/view/screens/splash_screen.dart';

abstract class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case PageRouteName.layout:
        return MaterialPageRoute(builder: (_) => const LayoutView());

      case PageRouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case PageRouteName.addNote:
        return MaterialPageRoute(builder: (_) => const AddNote());

      case PageRouteName.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      case PageRouteName.search:
        return MaterialPageRoute(builder: (_) => const SearchTap());
      case PageRouteName.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case PageRouteName.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case PageRouteName.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case PageRouteName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
