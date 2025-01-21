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
mixin _$StoryModel {
  String get id => throw _privateConstructorUsedError;
  ModelWithLang<String> get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  ModelWithLang<String> get description => throw _privateConstructorUsedError;
  ModelWithLang<String> get summary => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  List<AppLocaliaztionsEnum> get languages =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<StoryChapterModel> get chapters => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryModelCopyWith<StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) then) =
      _$StoryModelCopyWithImpl<$Res, StoryModel>;
  @useResult
  $Res call(
      {String id,
      ModelWithLang<String> title,
      String author,
      ModelWithLang<String> description,
      ModelWithLang<String> summary,
      String image,
      int year,
      List<AppLocaliaztionsEnum> languages,
      DateTime createdAt,
      DateTime updatedAt,
      List<StoryChapterModel> chapters,
      DateTime? deletedAt});
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res, $Val extends StoryModel>
    implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? description = null,
    Object? summary = null,
    Object? image = null,
    Object? year = null,
    Object? languages = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? chapters = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<AppLocaliaztionsEnum>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<StoryChapterModel>,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryModelImplCopyWith<$Res>
    implements $StoryModelCopyWith<$Res> {
  factory _$$StoryModelImplCopyWith(
          _$StoryModelImpl value, $Res Function(_$StoryModelImpl) then) =
      __$$StoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ModelWithLang<String> title,
      String author,
      ModelWithLang<String> description,
      ModelWithLang<String> summary,
      String image,
      int year,
      List<AppLocaliaztionsEnum> languages,
      DateTime createdAt,
      DateTime updatedAt,
      List<StoryChapterModel> chapters,
      DateTime? deletedAt});
}

/// @nodoc
class __$$StoryModelImplCopyWithImpl<$Res>
    extends _$StoryModelCopyWithImpl<$Res, _$StoryModelImpl>
    implements _$$StoryModelImplCopyWith<$Res> {
  __$$StoryModelImplCopyWithImpl(
      _$StoryModelImpl _value, $Res Function(_$StoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? description = null,
    Object? summary = null,
    Object? image = null,
    Object? year = null,
    Object? languages = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? chapters = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$StoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<AppLocaliaztionsEnum>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<StoryChapterModel>,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$StoryModelImpl extends _StoryModel {
  const _$StoryModelImpl(
      {required this.id,
      required this.title,
      required this.author,
      required this.description,
      required this.summary,
      required this.image,
      required this.year,
      required final List<AppLocaliaztionsEnum> languages,
      required this.createdAt,
      required this.updatedAt,
      required final List<StoryChapterModel> chapters,
      this.deletedAt = null})
      : _languages = languages,
        _chapters = chapters,
        super._();

  @override
  final String id;
  @override
  final ModelWithLang<String> title;
  @override
  final String author;
  @override
  final ModelWithLang<String> description;
  @override
  final ModelWithLang<String> summary;
  @override
  final String image;
  @override
  final int year;
  final List<AppLocaliaztionsEnum> _languages;
  @override
  List<AppLocaliaztionsEnum> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<StoryChapterModel> _chapters;
  @override
  List<StoryChapterModel> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  @JsonKey()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'StoryModel(id: $id, title: $title, author: $author, description: $description, summary: $summary, image: $image, year: $year, languages: $languages, createdAt: $createdAt, updatedAt: $updatedAt, chapters: $chapters, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      author,
      description,
      summary,
      image,
      year,
      const DeepCollectionEquality().hash(_languages),
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_chapters),
      deletedAt);

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryModelImplCopyWith<_$StoryModelImpl> get copyWith =>
      __$$StoryModelImplCopyWithImpl<_$StoryModelImpl>(this, _$identity);
}

abstract class _StoryModel extends StoryModel {
  const factory _StoryModel(
      {required final String id,
      required final ModelWithLang<String> title,
      required final String author,
      required final ModelWithLang<String> description,
      required final ModelWithLang<String> summary,
      required final String image,
      required final int year,
      required final List<AppLocaliaztionsEnum> languages,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<StoryChapterModel> chapters,
      final DateTime? deletedAt}) = _$StoryModelImpl;
  const _StoryModel._() : super._();

  @override
  String get id;
  @override
  ModelWithLang<String> get title;
  @override
  String get author;
  @override
  ModelWithLang<String> get description;
  @override
  ModelWithLang<String> get summary;
  @override
  String get image;
  @override
  int get year;
  @override
  List<AppLocaliaztionsEnum> get languages;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<StoryChapterModel> get chapters;
  @override
  DateTime? get deletedAt;

  /// Create a copy of StoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryModelImplCopyWith<_$StoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
