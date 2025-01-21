import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penta_story/data/models/others/model_with_lang.dart';
import 'package:penta_story/data/models/stories/story_page_model.dart';

part 'story_chapter_model.freezed.dart';

@freezed
abstract class StoryChapterModel with _$StoryChapterModel {
  const factory StoryChapterModel({
    required String id,
    required int index,
    required ModelWithLang<String> title,
    required ModelWithLang<String> description,
    required List<StoryPageModel> pages,
  }) = _StoryChapterModel;

  factory StoryChapterModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
    required List<StoryPageModel> pages,
  }) {
    return StoryChapterModel(
      id: id,
      index: json[indexKey] as int,
      title: ModelWithLang.fromJson(json[titleKey] as Map<String, String>),
      description:
          ModelWithLang.fromJson(json[descriptionKey] as Map<String, String>),
      pages: pages,
    );
  }

  static const indexKey = 'index';
  static const titleKey = 'title';
  static const descriptionKey = 'description';
}
