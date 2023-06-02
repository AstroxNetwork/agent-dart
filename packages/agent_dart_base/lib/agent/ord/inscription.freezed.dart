// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Inscription _$InscriptionFromJson(Map<String, dynamic> json) {
  return _Inscription.fromJson(json);
}

/// @nodoc
mixin _$Inscription {
  String get id => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  int? get num => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InscriptionCopyWith<Inscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InscriptionCopyWith<$Res> {
  factory $InscriptionCopyWith(
          Inscription value, $Res Function(Inscription) then) =
      _$InscriptionCopyWithImpl<$Res, Inscription>;
  @useResult
  $Res call({String id, int offset, int? number, int? num});
}

/// @nodoc
class _$InscriptionCopyWithImpl<$Res, $Val extends Inscription>
    implements $InscriptionCopyWith<$Res> {
  _$InscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offset = null,
    Object? number = freezed,
    Object? num = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      num: freezed == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InscriptionCopyWith<$Res>
    implements $InscriptionCopyWith<$Res> {
  factory _$$_InscriptionCopyWith(
          _$_Inscription value, $Res Function(_$_Inscription) then) =
      __$$_InscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int offset, int? number, int? num});
}

/// @nodoc
class __$$_InscriptionCopyWithImpl<$Res>
    extends _$InscriptionCopyWithImpl<$Res, _$_Inscription>
    implements _$$_InscriptionCopyWith<$Res> {
  __$$_InscriptionCopyWithImpl(
      _$_Inscription _value, $Res Function(_$_Inscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offset = null,
    Object? number = freezed,
    Object? num = freezed,
  }) {
    return _then(_$_Inscription(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      num: freezed == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Inscription implements _Inscription {
  _$_Inscription(
      {required this.id, required this.offset, this.number, this.num});

  factory _$_Inscription.fromJson(Map<String, dynamic> json) =>
      _$$_InscriptionFromJson(json);

  @override
  final String id;
  @override
  final int offset;
  @override
  final int? number;
  @override
  final int? num;

  @override
  String toString() {
    return 'Inscription(id: $id, offset: $offset, number: $number, num: $num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Inscription &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.num, num) || other.num == num));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, offset, number, num);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InscriptionCopyWith<_$_Inscription> get copyWith =>
      __$$_InscriptionCopyWithImpl<_$_Inscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InscriptionToJson(
      this,
    );
  }
}

abstract class _Inscription implements Inscription {
  factory _Inscription(
      {required final String id,
      required final int offset,
      final int? number,
      final int? num}) = _$_Inscription;

  factory _Inscription.fromJson(Map<String, dynamic> json) =
      _$_Inscription.fromJson;

  @override
  String get id;
  @override
  int get offset;
  @override
  int? get number;
  @override
  int? get num;
  @override
  @JsonKey(ignore: true)
  _$$_InscriptionCopyWith<_$_Inscription> get copyWith =>
      throw _privateConstructorUsedError;
}
