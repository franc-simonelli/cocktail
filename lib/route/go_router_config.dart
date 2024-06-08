// ignore_for_file: unused_element
import 'package:cocktail/details_drink/details_drink.dart';
import 'package:cocktail/details_drink/details_drink_provider.dart';
import 'package:cocktail/drink/drink.dart';
import 'package:cocktail/ingredienti/add_favorite/add_favorite_ingrediente.dart';
import 'package:cocktail/home/home.dart';
import 'package:cocktail/ingredienti/all_ingredienti/all_ingredienti.dart';
import 'package:cocktail/splash_screen/splash_scree.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract final class ScreenPaths {
  static const splash = '/splash';
  static const home = '/home';
  static const addFavoriteIngredienti = '/addFavoriteIngredienti';
  static const allIngredienti = '/allIngredienti';
  static const drinks = '/drinks';
  static const drinkDetails = '/drinkDetails';
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
    GoRoute(
      path: ScreenPaths.allIngredienti,
      builder: (context, state) {
        return const AllIngredienti();
      },
    ),
    GoRoute(
      path: ScreenPaths.drinks,
      builder: (context, state) {
        return const Drink();
      },
    ),
    GoRoute(
      path: ScreenPaths.drinkDetails,
      builder: (context, state) {
        final idDrink = state.extra as String;
        return ChangeNotifierProvider(
          create: (_) => DetailsDrinkProvider()..getDrinkById(idDrink),
          child: const DrinkDetails(),
        );
      },
    ),
  ],
);
