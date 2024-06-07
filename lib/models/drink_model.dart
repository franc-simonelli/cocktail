import 'package:freezed_annotation/freezed_annotation.dart';
part 'drink_model.freezed.dart';
part 'drink_model.g.dart';

@freezed
class DrinkModel with _$DrinkModel {
  const factory DrinkModel({
    String? idDrink,
    String? strDrink,
    String? strDrinkThumb,
    String? strCategory,
    String? strAlcoholic,
    String? strGlass,
    String? strInstructionsIT,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
  }) = _DrinkModel;

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);
}
