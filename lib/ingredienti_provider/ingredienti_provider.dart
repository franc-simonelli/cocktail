import 'package:cocktail/constants/shared_preferences_constants.dart';
import 'package:cocktail/core/di/shared_export.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

enum Status { initial, success, error, loading }

extension StatusX on Status {
  bool get isInitial => this == Status.initial;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isLoading => this == Status.loading;
}

class IngredientiProvider extends ChangeNotifier {
  Status statusAllIngredienti = Status.initial;
  Status statusIngredientiPreferiti = Status.initial;
  List<IngredientiModel> allIngredienti = [];
  List<IngredientiModel> ingredientiPreferiti = [];
  List<IngredientiModel> allIngredientiWithImage = [];

  getAllIngredienti() async {
    statusAllIngredienti = Status.loading;
    notifyListeners();
    try {
      allIngredienti = await ingredientiRepository.getAllIngredienti();
      allIngredientiWithImage = addImageToIngredienti();
      statusAllIngredienti = Status.success;
    } catch (e) {
      statusAllIngredienti = Status.error;
    }
    notifyListeners();
    getIngredientiPreferiti();
  }

  getIngredientiPreferiti() async {
    statusIngredientiPreferiti = Status.loading;
    try {
      List<String> ingredientiPreferitiSP =
          await sharedPrefsService.getValue(kIngredientiPreferiti) ?? [];
      if (ingredientiPreferitiSP.isNotEmpty) {
        for (var element in ingredientiPreferitiSP) {
          final ingrediente = allIngredientiWithImage
              .firstWhereOrNull((item) => item.strIngredient1 == element);
          if (ingrediente != null) {
            ingredientiPreferiti.add(ingrediente);
          }
        }
      } else {
        ingredientiPreferiti = [];
      }
      statusIngredientiPreferiti = Status.success;
    } catch (e) {
      statusIngredientiPreferiti = Status.error;
    }
    notifyListeners();
  }

  saveIngredientePreferito(IngredientiModel ingrediente) async {
    if (!ingredientiPreferiti.contains(ingrediente)) {
      ingredientiPreferiti.insert(0, ingrediente);
      List<String> ingredientiPreferitiSP =
          await sharedPrefsService.getValue(kIngredientiPreferiti) ?? [];

      ingredientiPreferitiSP.insert(0, ingrediente.strIngredient1);
      await sharedPrefsService.setValue(
          kIngredientiPreferiti, ingredientiPreferitiSP);
      notifyListeners();
    } else {
      ingredientiPreferiti.remove(ingrediente);
      List<String> ingredientiPreferitiSP =
          await sharedPrefsService.getValue(kIngredientiPreferiti) ?? [];
      ingredientiPreferitiSP.remove(ingrediente.strIngredient1);
      await sharedPrefsService.setValue(
          kIngredientiPreferiti, ingredientiPreferitiSP);
      notifyListeners();
    }
  }

  removeAllIngredientiPreferiti() async {
    await sharedPrefsService.removeValue(kIngredientiPreferiti);
    getIngredientiPreferiti();
  }

  addImageToIngredienti() {
    List<IngredientiModel> allIngredientiWithImage = [];

    allIngredienti.forEach((element) {
      String newNameImage = configNameImage(element);
      allIngredientiWithImage.add(
        element.copyWith(
            image:
                "https://www.thecocktaildb.com/images/ingredients/$newNameImage-Small.png"),
      );
      print(allIngredientiWithImage);
    });
    return allIngredientiWithImage;
  }

  configNameImage(IngredientiModel item) {
    if (item.strIngredient1.contains(' ')) {
      return item.strIngredient1.replaceAll(' ', '%20');
    } else {
      return item.strIngredient1;
    }
  }
}
