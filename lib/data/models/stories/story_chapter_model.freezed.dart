// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryChapterModel {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  ModelWithLang<String> get title => throw _privateConstructorUsedError;
  ModelWithLang<String> get description => throw _privateConstructorUsedError;
  List<StoryPageModel> get pages => throw _privateConstructorUsedError;

  /// Create a copy of StoryChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryChapterModelCopyWith<StoryChapterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryChapterModelCopyWith<$Res> {
  factory $StoryChapterModelCopyWith(
          StoryChapterModel value, $Res Function(StoryChapterModel) then) =
      _$StoryChapterModelCopyWithImpl<$Res, StoryChapterModel>;
  @useResult
  $Res call(
      {String id,
      int index,
      ModelWithLang<String> title,
      ModelWithLang<String> description,
      List<StoryPageModel> pages});
}

/// @nodoc
class _$StoryChapterModelCopyWithImpl<$Res, $Val extends StoryChapterModel>
    implements $StoryChapterModelCopyWith<$Res> {
  _$StoryChapterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? title = null,
    Object? description = null,
    Object? pages = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<StoryPageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryChapterModelImplCopyWith<$Res>
    implements $StoryChapterModelCopyWith<$Res> {
  factory _$$StoryChapterModelImplCopyWith(_$StoryChapterModelImpl value,
          $Res Function(_$StoryChapterModelImpl) then) =
      __$$StoryChapterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int index,
      ModelWithLang<String> title,
      ModelWithLang<String> description,
      List<StoryPageModel> pages});
}

/// @nodoc
class __$$StoryChapterModelImplCopyWithImpl<$Res>
    extends _$StoryChapterModelCopyWithImpl<$Res, _$StoryChapterModelImpl>
    implements _$$StoryChapterModelImplCopyWith<$Res> {
  __$$StoryChapterModelImplCopyWithImpl(_$StoryChapterModelImpl _value,
      $Res Function(_$StoryChapterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? title = null,
    Object? description = null,
    Object? pages = null,
  }) {
    return _then(_$StoryChapterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ModelWithLang<String>,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<StoryPageModel>,
    ));
  }
}

/// @nodoc

class _$StoryChapterModelImpl extends _StoryChapterModel {
  const _$StoryChapterModelImpl(
      {required this.id,
      required this.index,
      required this.title,
      required this.description,
      required final List<StoryPageModel> pages})
      : _pages = pages,
        super._();

  @override
  final String id;
  @override
  final int index;
  @override
  final ModelWithLang<String> title;
  @override
  final ModelWithLang<String> description;
  final List<StoryPageModel> _pages;
  @override
  List<StoryPageModel> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  @override
  String toString() {
    return 'StoryChapterModel(id: $id, index: $index, title: $title, description: $description, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryChapterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._pages, _pages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, index, title, description,
      const DeepCollectionEquality().hash(_pages));

  /// Create a copy of StoryChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryChapterModelImplCopyWith<_$StoryChapterModelImpl> get copyWith =>
      __$$StoryChapterModelImplCopyWithImpl<_$StoryChapterModelImpl>(
          this, _$identity);
}

abstract class _StoryChapterModel extends StoryChapterModel {
  const factory _StoryChapterModel(
      {required final String id,
      required final int index,
      required final ModelWithLang<String> title,
      required final ModelWithLang<String> description,
      required final List<StoryPageModel> pages}) = _$StoryChapterModelImpl;
  const _StoryChapterModel._() : super._();

  @override
  String get id;
  @override
  int get index;
  @override
  ModelWithLang<String> get title;
  @override
  ModelWithLang<String> get description;
  @override
  List<StoryPageModel> get pages;

  /// Create a copy of StoryChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryChapterModelImplCopyWith<_$StoryChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
