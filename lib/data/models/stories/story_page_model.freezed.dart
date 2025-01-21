// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryPageModel {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<StoryPagePartModel> get parts => throw _privateConstructorUsedError;

  /// Create a copy of StoryPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryPageModelCopyWith<StoryPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryPageModelCopyWith<$Res> {
  factory $StoryPageModelCopyWith(
          StoryPageModel value, $Res Function(StoryPageModel) then) =
      _$StoryPageModelCopyWithImpl<$Res, StoryPageModel>;
  @useResult
  $Res call(
      {String id, int index, String image, List<StoryPagePartModel> parts});
}

/// @nodoc
class _$StoryPageModelCopyWithImpl<$Res, $Val extends StoryPageModel>
    implements $StoryPageModelCopyWith<$Res> {
  _$StoryPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? image = null,
    Object? parts = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<StoryPagePartModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryPageModelImplCopyWith<$Res>
    implements $StoryPageModelCopyWith<$Res> {
  factory _$$StoryPageModelImplCopyWith(_$StoryPageModelImpl value,
          $Res Function(_$StoryPageModelImpl) then) =
      __$$StoryPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, int index, String image, List<StoryPagePartModel> parts});
}

/// @nodoc
class __$$StoryPageModelImplCopyWithImpl<$Res>
    extends _$StoryPageModelCopyWithImpl<$Res, _$StoryPageModelImpl>
    implements _$$StoryPageModelImplCopyWith<$Res> {
  __$$StoryPageModelImplCopyWithImpl(
      _$StoryPageModelImpl _value, $Res Function(_$StoryPageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? image = null,
    Object? parts = null,
  }) {
    return _then(_$StoryPageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<StoryPagePartModel>,
    ));
  }
}

/// @nodoc

class _$StoryPageModelImpl implements _StoryPageModel {
  const _$StoryPageModelImpl(
      {required this.id,
      required this.index,
      required this.image,
      required final List<StoryPagePartModel> parts})
      : _parts = parts;

  @override
  final String id;
  @override
  final int index;
  @override
  final String image;
  final List<StoryPagePartModel> _parts;
  @override
  List<StoryPagePartModel> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  String toString() {
    return 'StoryPageModel(id: $id, index: $index, image: $image, parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryPageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index, image,
      const DeepCollectionEquality().hash(_parts));

  /// Create a copy of StoryPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryPageModelImplCopyWith<_$StoryPageModelImpl> get copyWith =>
      __$$StoryPageModelImplCopyWithImpl<_$StoryPageModelImpl>(
          this, _$identity);
}

abstract class _StoryPageModel implements StoryPageModel {
  const factory _StoryPageModel(
      {required final String id,
      required final int index,
      required final String image,
      required final List<StoryPagePartModel> parts}) = _$StoryPageModelImpl;

  @override
  String get id;
  @override
  int get index;
  @override
  String get image;
  @override
  List<StoryPagePartModel> get parts;

  /// Create a copy of StoryPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryPageModelImplCopyWith<_$StoryPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
