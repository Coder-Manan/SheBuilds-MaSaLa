import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/CartScreen/cart_screen.dart';
import 'package:frontend/presentation/CartScreen/cart_screen_bloc.dart';
import 'package:frontend/presentation/HomeScreen/home_screen.dart';
import 'package:frontend/presentation/HomeScreen/home_screen_bloc.dart';
import 'package:frontend/presentation/InfoScreen/info_screen_bloc.dart';
import 'package:frontend/presentation/InfoScreen/info_screen.dart';
import 'package:frontend/presentation/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.id:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case InfoScreen.id:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: InfoScreenBloc(),
                  child: const InfoScreen(),
                ));
      case HomeScreen.id:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: HomeScreenBloc()..add(InitialEvent()),
                  child: const HomeScreen(),
                ));
      case CartScreen.id:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: CartScreenBloc()..add(CartInitialEvent()),
                  child: const CartScreen(),
                ));
      default:
        throw (Exception());
    }
  }
}
