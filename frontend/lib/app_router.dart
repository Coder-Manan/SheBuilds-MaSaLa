import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/InfoScreen/bloc/info_screen_bloc.dart';
import 'package:frontend/presentation/InfoScreen/info_screen.dart';
import 'package:frontend/presentation/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case 'registration':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: InfoScreenBloc(),
                  child: const InfoScreen(),
                ));
      default:
        throw (Exception());
    }
  }
}
