// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_chapter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryChapterEntity {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of StoryChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryChapterEntityCopyWith<StoryChapterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryChapterEntityCopyWith<$Res> {
  factory $StoryChapterEntityCopyWith(
          StoryChapterEntity value, $Res Function(StoryChapterEntity) then) =
      _$StoryChapterEntityCopyWithImpl<$Res, StoryChapterEntity>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$StoryChapterEntityCopyWithImpl<$Res, $Val extends StoryChapterEntity>
    implements $StoryChapterEntityCopyWith<$Res> {
  _$StoryChapterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryChapterEntityImplCopyWith<$Res>
    implements $StoryChapterEntityCopyWith<$Res> {
  factory _$$StoryChapterEntityImplCopyWith(_$StoryChapterEntityImpl value,
          $Res Function(_$StoryChapterEntityImpl) then) =
      __$$StoryChapterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$StoryChapterEntityImplCopyWithImpl<$Res>
    extends _$StoryChapterEntityCopyWithImpl<$Res, _$StoryChapterEntityImpl>
    implements _$$StoryChapterEntityImplCopyWith<$Res> {
  __$$StoryChapterEntityImplCopyWithImpl(_$StoryChapterEntityImpl _value,
      $Res Function(_$StoryChapterEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$StoryChapterEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoryChapterEntityImpl implements _StoryChapterEntity {
  const _$StoryChapterEntityImpl(
      {required this.title, required this.description});

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'StoryChapterEntity(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryChapterEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  /// Create a copy of StoryChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryChapterEntityImplCopyWith<_$StoryChapterEntityImpl> get copyWith =>
      __$$StoryChapterEntityImplCopyWithImpl<_$StoryChapterEntityImpl>(
          this, _$identity);
}

abstract class _StoryChapterEntity implements StoryChapterEntity {
  const factory _StoryChapterEntity(
      {required final String title,
      required final String description}) = _$StoryChapterEntityImpl;

  @override
  String get title;
  @override
  String get description;

  /// Create a copy of StoryChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryChapterEntityImplCopyWith<_$StoryChapterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
