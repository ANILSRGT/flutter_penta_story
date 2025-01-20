// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryEntity {
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;

  /// Create a copy of StoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryEntityCopyWith<StoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEntityCopyWith<$Res> {
  factory $StoryEntityCopyWith(
          StoryEntity value, $Res Function(StoryEntity) then) =
      _$StoryEntityCopyWithImpl<$Res, StoryEntity>;
  @useResult
  $Res call(
      {String title,
      String author,
      String description,
      String summary,
      String image,
      int year});
}

/// @nodoc
class _$StoryEntityCopyWithImpl<$Res, $Val extends StoryEntity>
    implements $StoryEntityCopyWith<$Res> {
  _$StoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? description = null,
    Object? summary = null,
    Object? image = null,
    Object? year = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryEntityImplCopyWith<$Res>
    implements $StoryEntityCopyWith<$Res> {
  factory _$$StoryEntityImplCopyWith(
          _$StoryEntityImpl value, $Res Function(_$StoryEntityImpl) then) =
      __$$StoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String author,
      String description,
      String summary,
      String image,
      int year});
}

/// @nodoc
class __$$StoryEntityImplCopyWithImpl<$Res>
    extends _$StoryEntityCopyWithImpl<$Res, _$StoryEntityImpl>
    implements _$$StoryEntityImplCopyWith<$Res> {
  __$$StoryEntityImplCopyWithImpl(
      _$StoryEntityImpl _value, $Res Function(_$StoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? description = null,
    Object? summary = null,
    Object? image = null,
    Object? year = null,
  }) {
    return _then(_$StoryEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StoryEntityImpl implements _StoryEntity {
  const _$StoryEntityImpl(
      {required this.title,
      required this.author,
      required this.description,
      required this.summary,
      required this.image,
      required this.year});

  @override
  final String title;
  @override
  final String author;
  @override
  final String description;
  @override
  final String summary;
  @override
  final String image;
  @override
  final int year;

  @override
  String toString() {
    return 'StoryEntity(title: $title, author: $author, description: $description, summary: $summary, image: $image, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, author, description, summary, image, year);

  /// Create a copy of StoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryEntityImplCopyWith<_$StoryEntityImpl> get copyWith =>
      __$$StoryEntityImplCopyWithImpl<_$StoryEntityImpl>(this, _$identity);
}

abstract class _StoryEntity implements StoryEntity {
  const factory _StoryEntity(
      {required final String title,
      required final String author,
      required final String description,
      required final String summary,
      required final String image,
      required final int year}) = _$StoryEntityImpl;

  @override
  String get title;
  @override
  String get author;
  @override
  String get description;
  @override
  String get summary;
  @override
  String get image;
  @override
  int get year;

  /// Create a copy of StoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryEntityImplCopyWith<_$StoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
