import 'package:cocktail/constants/shared_preferences_constants.dart';
import 'package:cocktail/core/di/shared_export.dart';
import 'package:cocktail/models/ingredienti_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

enum Status { initial, success, error, loading }

// extension StatusX on Status {
//   bool get isInitial => this == Status.initial;
//   bool get isSuccess => this == Status.success;
//   bool get isError => this == Status.error;
//   bool get isLoading => this == Status.loading;
// }

class IngredientiProvider extends ChangeNotifier {
  Status _statusAllIngredienti = Status.initial;
  Status _statusIngredientiPreferiti = Status.initial;

  List<IngredientiModel> _ingredientiPreferiti = [];
  List<IngredientiModel> _allIngredienti = [];
  List<IngredientiModel> _allIngredientiFiltrati = [];

  Status get statusAllIngredienti => _statusAllIngredienti;
  Status get statusIngredientiPreferiti => _statusIngredientiPreferiti;
  List<IngredientiModel> get ingredientiPreferiti => _ingredientiPreferiti;
  List<IngredientiModel> get allIngredienti => _allIngredienti;
  List<IngredientiModel> get allIngredientiFiltrati => _allIngredientiFiltrati;

  getAllIngredienti() async {
    _statusAllIngredienti = Status.loading;
    _statusIngredientiPreferiti = Status.loading;
    notifyListeners();
    try {
      List<IngredientiModel> allIngredienti =
          await ingredientiRepository.getAllIngredienti();
      _allIngredienti = addImageToIngredienti(allIngredienti);
      _allIngredientiFiltrati = _allIngredienti;
      _statusAllIngredienti = Status.success;
    } catch (e) {
      _statusAllIngredienti = Status.error;
    }
    notifyListeners();
    getIngredientiPreferiti();
  }

  getIngredientiPreferiti() async {
    try {
      List<String> ingredientiPreferitiSP =
          await sharedPrefsService.getValue(kIngredientiPreferiti) ?? [];
      if (ingredientiPreferitiSP.isNotEmpty) {
        for (var element in ingredientiPreferitiSP) {
          final ingrediente = _allIngredienti
              .firstWhereOrNull((item) => item.strIngredient1 == element);
          if (ingrediente != null) {
            _ingredientiPreferiti.add(ingrediente);
          }
        }
      } else {
        _ingredientiPreferiti = [];
      }
      _statusIngredientiPreferiti = Status.success;
    } catch (e) {
      _statusIngredientiPreferiti = Status.error;
    }
    notifyListeners();
  }

  filtraIngredienti(String value) async {
    _allIngredientiFiltrati = _allIngredienti
        .where(
            (x) => x.strIngredient1.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  saveIngredientePreferito(IngredientiModel ingrediente) async {
    if (!_ingredientiPreferiti.contains(ingrediente)) {
      _ingredientiPreferiti.insert(0, ingrediente);
      List<String> ingredientiPreferitiSP =
          await sharedPrefsService.getValue(kIngredientiPreferiti) ?? [];

      ingredientiPreferitiSP.insert(0, ingrediente.strIngredient1);
      await sharedPrefsService.setValue(
          kIngredientiPreferiti, ingredientiPreferitiSP);
      notifyListeners();
    } else {
      _ingredientiPreferiti.remove(ingrediente);
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

  addImageToIngredienti(List<IngredientiModel> list) {
    List<IngredientiModel> allIngredientiWithImage = [];

    list.forEach((element) {
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
