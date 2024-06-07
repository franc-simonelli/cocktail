import 'package:cocktail/core/di/shared_export.dart';
import 'package:cocktail/ingredienti/ingredienti_provider.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:flutter/material.dart';

class DrinkProvider extends ChangeNotifier {
  List<DrinkModel> _drinksList = [];
  Status _drinkStatus = Status.initial;

  List<DrinkModel> get drinksList => _drinksList;
  Status get drinkStatus => _drinkStatus;
  bool get statusSuccess => _drinkStatus == Status.success;
  bool get statusLoading => _drinkStatus == Status.loading;

  getDrinksByIngrediente(IngredientiModel ingrediente) async {
    _drinksList = [];
    _drinkStatus = Status.loading;
    notifyListeners();

    try {
      _drinksList = await drinksRepository
          .getDrinksByIngrediente(ingrediente.strIngredient1);
      _drinkStatus = Status.success;
    } catch (e) {
      _drinkStatus = Status.error;
    }
    notifyListeners();
  }
}
