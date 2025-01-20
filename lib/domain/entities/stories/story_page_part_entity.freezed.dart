// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_page_part_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryPagePartEntity {
  String get content => throw _privateConstructorUsedError;

  /// Create a copy of StoryPagePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryPagePartEntityCopyWith<StoryPagePartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryPagePartEntityCopyWith<$Res> {
  factory $StoryPagePartEntityCopyWith(
          StoryPagePartEntity value, $Res Function(StoryPagePartEntity) then) =
      _$StoryPagePartEntityCopyWithImpl<$Res, StoryPagePartEntity>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$StoryPagePartEntityCopyWithImpl<$Res, $Val extends StoryPagePartEntity>
    implements $StoryPagePartEntityCopyWith<$Res> {
  _$StoryPagePartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryPagePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryPagePartEntityImplCopyWith<$Res>
    implements $StoryPagePartEntityCopyWith<$Res> {
  factory _$$StoryPagePartEntityImplCopyWith(_$StoryPagePartEntityImpl value,
          $Res Function(_$StoryPagePartEntityImpl) then) =
      __$$StoryPagePartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$StoryPagePartEntityImplCopyWithImpl<$Res>
    extends _$StoryPagePartEntityCopyWithImpl<$Res, _$StoryPagePartEntityImpl>
    implements _$$StoryPagePartEntityImplCopyWith<$Res> {
  __$$StoryPagePartEntityImplCopyWithImpl(_$StoryPagePartEntityImpl _value,
      $Res Function(_$StoryPagePartEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryPagePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$StoryPagePartEntityImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoryPagePartEntityImpl implements _StoryPagePartEntity {
  const _$StoryPagePartEntityImpl({required this.content});

  @override
  final String content;

  @override
  String toString() {
    return 'StoryPagePartEntity(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryPagePartEntityImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of StoryPagePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryPagePartEntityImplCopyWith<_$StoryPagePartEntityImpl> get copyWith =>
      __$$StoryPagePartEntityImplCopyWithImpl<_$StoryPagePartEntityImpl>(
          this, _$identity);
}

abstract class _StoryPagePartEntity implements StoryPagePartEntity {
  const factory _StoryPagePartEntity({required final String content}) =
      _$StoryPagePartEntityImpl;

  @override
  String get content;

  /// Create a copy of StoryPagePartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryPagePartEntityImplCopyWith<_$StoryPagePartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
