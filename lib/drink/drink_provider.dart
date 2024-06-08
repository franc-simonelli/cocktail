import 'package:cocktail/core/di/shared_export.dart';
import 'package:cocktail/ingredienti/ingredienti_provider.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:flutter/material.dart';

class DrinkProvider extends ChangeNotifier {
  List<DrinkModel> _drinks = [];
  List<DrinkModel> _drinksFiltrati = [];
  Status _drinkStatus = Status.initial;

  List<DrinkModel> get drinks => _drinks;
  List<DrinkModel> get drinksFiltrati => _drinksFiltrati;
  Status get drinkStatus => _drinkStatus;
  bool get statusSuccess => _drinkStatus == Status.success;
  bool get statusLoading => _drinkStatus == Status.loading;

  getDrinksByIngrediente(IngredientiModel ingrediente) async {
    _drinks = [];
    _drinkStatus = Status.loading;
    notifyListeners();

    try {
      _drinks = await drinksRepository
          .getDrinksByIngrediente(ingrediente.strIngredient1);
      _drinksFiltrati = _drinks;
      _drinkStatus = Status.success;
    } catch (e) {
      _drinkStatus = Status.error;
    }
    notifyListeners();
  }

  filtraDrinks(String value) async {
    _drinksFiltrati = _drinks
        .where((x) => x.strDrink!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
