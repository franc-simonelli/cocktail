import 'package:freezed_annotation/freezed_annotation.dart';
part 'ingredienti_model.freezed.dart';
part 'ingredienti_model.g.dart';

@freezed
class IngredientiModel with _$IngredientiModel {
  const factory IngredientiModel({
    required String strIngredient1,
    String? image,
  }) = _IngredientiModel;

  factory IngredientiModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientiModelFromJson(json);
}
