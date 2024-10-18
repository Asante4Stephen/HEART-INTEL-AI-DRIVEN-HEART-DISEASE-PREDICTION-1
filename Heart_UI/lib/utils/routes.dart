import 'package:flutter/cupertino.dart';
import 'package:insta_med_ui/components/bottom_navigation_widget.dart';
import 'package:insta_med_ui/screens/forgot_password_screen.dart';
import 'package:insta_med_ui/screens/get_started_screen.dart';
import 'package:insta_med_ui/screens/homescreen/HistoryScree.dart';

import 'package:insta_med_ui/screens/homescreen/InputScreen.dart';
import 'package:insta_med_ui/screens/homescreen/ChatScreen.dart'; 

import 'package:insta_med_ui/screens/homescreen/profile.dart';
import 'package:insta_med_ui/screens/login_screen.dart';
import 'package:insta_med_ui/screens/register_screen.dart';
import 'package:insta_med_ui/screens/splash_screen.dart';
import 'package:insta_med_ui/screens/verify_screen.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case '/getStarted':
        return CupertinoPageRoute(builder: (_) => const GetStartedScreen());
      case '/login':
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case '/forgotPassword':
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/verify':
        return CupertinoPageRoute(builder: (_) => const VerifyScreen());
      case '/home':
        return CupertinoPageRoute(builder: (_) => const BottomNavigationWidget());
      case '/history':
        return CupertinoPageRoute(builder: (_) => const HistoryScreen());
      case '/input':
        return CupertinoPageRoute(builder: (_) => const InputScreen());
      case '/chat':
        return CupertinoPageRoute(builder: (_) => const ChatScreen());
      case '/profile':
        return CupertinoPageRoute(builder: (_) => const ProfileScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen()); // Default route
    }
  }
}
