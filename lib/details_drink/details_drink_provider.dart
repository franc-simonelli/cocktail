import 'package:cocktail/core/di/shared_export.dart';
import 'package:cocktail/ingredienti/ingredienti_provider.dart';
import 'package:cocktail/models/drink_model.dart';
import 'package:flutter/material.dart';

class DetailsDrinkProvider extends ChangeNotifier {
  Status _status = Status.initial;

  DrinkModel? _drink;

  DrinkModel? get drink => _drink;
  bool get statusSuccess => _status == Status.success;
  bool get statusLoading => _status == Status.loading;
  bool get statusError => _status == Status.error;

  getDrinkById(String id) async {
    _status = Status.loading;
    notifyListeners();

    try {
      _drink = await drinksRepository.getDrinkById(id);
      _status = Status.success;
    } catch (e) {
      _status = Status.error;
    }

    notifyListeners();
  }
}
