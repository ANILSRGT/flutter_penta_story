// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_page_part_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryPagePartModel {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  ModelWithLang<String> get content => throw _privateConstructorUsedError;

  /// Create a copy of StoryPagePartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryPagePartModelCopyWith<StoryPagePartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryPagePartModelCopyWith<$Res> {
  factory $StoryPagePartModelCopyWith(
          StoryPagePartModel value, $Res Function(StoryPagePartModel) then) =
      _$StoryPagePartModelCopyWithImpl<$Res, StoryPagePartModel>;
  @useResult
  $Res call({String id, int index, ModelWithLang<String> content});
}

/// @nodoc
class _$StoryPagePartModelCopyWithImpl<$Res, $Val extends StoryPagePartModel>
    implements $StoryPagePartModelCopyWith<$Res> {
  _$StoryPagePartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryPagePartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? content = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryPagePartModelImplCopyWith<$Res>
    implements $StoryPagePartModelCopyWith<$Res> {
  factory _$$StoryPagePartModelImplCopyWith(_$StoryPagePartModelImpl value,
          $Res Function(_$StoryPagePartModelImpl) then) =
      __$$StoryPagePartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int index, ModelWithLang<String> content});
}

/// @nodoc
class __$$StoryPagePartModelImplCopyWithImpl<$Res>
    extends _$StoryPagePartModelCopyWithImpl<$Res, _$StoryPagePartModelImpl>
    implements _$$StoryPagePartModelImplCopyWith<$Res> {
  __$$StoryPagePartModelImplCopyWithImpl(_$StoryPagePartModelImpl _value,
      $Res Function(_$StoryPagePartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryPagePartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? content = null,
  }) {
    return _then(_$StoryPagePartModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
    ));
  }
}

/// @nodoc

class _$StoryPagePartModelImpl extends _StoryPagePartModel {
  const _$StoryPagePartModelImpl(
      {required this.id, required this.index, required this.content})
      : super._();

  @override
  final String id;
  @override
  final int index;
  @override
  final ModelWithLang<String> content;

  @override
  String toString() {
    return 'StoryPagePartModel(id: $id, index: $index, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryPagePartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index, content);

  /// Create a copy of StoryPagePartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryPagePartModelImplCopyWith<_$StoryPagePartModelImpl> get copyWith =>
      __$$StoryPagePartModelImplCopyWithImpl<_$StoryPagePartModelImpl>(
          this, _$identity);
}

abstract class _StoryPagePartModel extends StoryPagePartModel {
  const factory _StoryPagePartModel(
      {required final String id,
      required final int index,
      required final ModelWithLang<String> content}) = _$StoryPagePartModelImpl;
  const _StoryPagePartModel._() : super._();

  @override
  String get id;
  @override
  int get index;
  @override
  ModelWithLang<String> get content;

  /// Create a copy of StoryPagePartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryPagePartModelImplCopyWith<_$StoryPagePartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
