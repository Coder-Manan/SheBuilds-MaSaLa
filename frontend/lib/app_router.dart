import 'package:flutter/material.dart';
import 'package:frontend/presentation/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        throw (Exception());
    }
  }
}
