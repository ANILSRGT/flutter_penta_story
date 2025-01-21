import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_story/core/utils/timestamp_converter.dart';
import 'package:penta_story/data/models/others/model_with_lang.dart';
import 'package:penta_story/data/models/stories/story_chapter_model.dart';

part 'story_entity.freezed.dart';

@freezed
abstract class StoryModel with _$StoryModel {
  const factory StoryModel({
    required String id,
    required ModelWithLang<String> title,
    required String author,
    required ModelWithLang<String> description,
    required ModelWithLang<String> summary,
    required String image,
    required int year,
    required List<AppLocaliaztionsEnum> languages,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<StoryChapterModel> chapters,
    @Default(null) DateTime? deletedAt,
  }) = _StoryModel;

  factory StoryModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
    required List<StoryChapterModel> chapters,
  }) {
    return StoryModel(
      id: id,
      title: ModelWithLang.fromJson(json[titleKey] as Map<String, String>),
      author: json[authorKey] as String,
      description:
          ModelWithLang.fromJson(json[descriptionKey] as Map<String, String>),
      summary: ModelWithLang.fromJson(json[summaryKey] as Map<String, String>),
      image: json[imageKey] as String,
      year: json[yearKey] as int,
      languages: (json[languagesKey] as List)
          .map((e) => AppLocaliaztionsEnum.fromLocaleString(e as String))
          .toList(),
      createdAt: TimestampConverter.convertToDateTimeLocal(
        json['createdAt'] as int,
      ),
      updatedAt: TimestampConverter.convertToDateTimeLocal(
        json['updatedAt'] as int,
      ),
      deletedAt: json['deletedAt'] == null
          ? null
          : TimestampConverter.convertToDateTimeLocal(
              json['deletedAt'] as int,
            ),
      chapters: chapters,
    );
  }

  static const titleKey = 'title';
  static const authorKey = 'author';
  static const descriptionKey = 'description';
  static const summaryKey = 'summary';
  static const imageKey = 'image';
  static const yearKey = 'year';
  static const languagesKey = 'languages';
}
