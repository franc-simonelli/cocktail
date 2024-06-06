// ignore_for_file: unused_element
import 'package:cocktail/add_favorite/add_favorite_ingrediente.dart';
import 'package:cocktail/home/home.dart';
import 'package:cocktail/splash_screen/splash_scree.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class ScreenPaths {
  static const splash = '/splash';
  static const home = '/home';
  static const addFavoriteIngredienti = '/addFavoriteIngredienti';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: ScreenPaths.home,
  routes: [
    // _getBottom(),
    GoRoute(
      path: ScreenPaths.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    GoRoute(
      path: ScreenPaths.home,
      builder: (context, state) {
        return const Home();
      },
    ),
    GoRoute(
      path: ScreenPaths.addFavoriteIngredienti,
      builder: (context, state) {
        return const AddFavoriteIngrediente();
      },
    ),
  ],
);
