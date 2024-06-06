// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredienti_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientiModel _$IngredientiModelFromJson(Map<String, dynamic> json) {
  return _IngredientiModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientiModel {
  String get strIngredient1 => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientiModelCopyWith<IngredientiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientiModelCopyWith<$Res> {
  factory $IngredientiModelCopyWith(
          IngredientiModel value, $Res Function(IngredientiModel) then) =
      _$IngredientiModelCopyWithImpl<$Res, IngredientiModel>;
  @useResult
  $Res call({String strIngredient1, String? image});
}

/// @nodoc
class _$IngredientiModelCopyWithImpl<$Res, $Val extends IngredientiModel>
    implements $IngredientiModelCopyWith<$Res> {
  _$IngredientiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strIngredient1 = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      strIngredient1: null == strIngredient1
          ? _value.strIngredient1
          : strIngredient1 // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientiModelImplCopyWith<$Res>
    implements $IngredientiModelCopyWith<$Res> {
  factory _$$IngredientiModelImplCopyWith(_$IngredientiModelImpl value,
          $Res Function(_$IngredientiModelImpl) then) =
      __$$IngredientiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String strIngredient1, String? image});
}

/// @nodoc
class __$$IngredientiModelImplCopyWithImpl<$Res>
    extends _$IngredientiModelCopyWithImpl<$Res, _$IngredientiModelImpl>
    implements _$$IngredientiModelImplCopyWith<$Res> {
  __$$IngredientiModelImplCopyWithImpl(_$IngredientiModelImpl _value,
      $Res Function(_$IngredientiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strIngredient1 = null,
    Object? image = freezed,
  }) {
    return _then(_$IngredientiModelImpl(
      strIngredient1: null == strIngredient1
          ? _value.strIngredient1
          : strIngredient1 // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientiModelImpl implements _IngredientiModel {
  const _$IngredientiModelImpl({required this.strIngredient1, this.image});

  factory _$IngredientiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientiModelImplFromJson(json);

  @override
  final String strIngredient1;
  @override
  final String? image;

  @override
  String toString() {
    return 'IngredientiModel(strIngredient1: $strIngredient1, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientiModelImpl &&
            (identical(other.strIngredient1, strIngredient1) ||
                other.strIngredient1 == strIngredient1) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, strIngredient1, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientiModelImplCopyWith<_$IngredientiModelImpl> get copyWith =>
      __$$IngredientiModelImplCopyWithImpl<_$IngredientiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientiModelImplToJson(
      this,
    );
  }
}

abstract class _IngredientiModel implements IngredientiModel {
  const factory _IngredientiModel(
      {required final String strIngredient1,
      final String? image}) = _$IngredientiModelImpl;

  factory _IngredientiModel.fromJson(Map<String, dynamic> json) =
      _$IngredientiModelImpl.fromJson;

  @override
  String get strIngredient1;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$IngredientiModelImplCopyWith<_$IngredientiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
