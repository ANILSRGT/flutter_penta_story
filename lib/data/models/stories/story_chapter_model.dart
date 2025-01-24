import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penta_story/data/models/others/model_with_lang.dart';
import 'package:penta_story/data/models/stories/story_page_model.dart';

part 'story_chapter_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class StoryChapterModel with _$StoryChapterModel {
  const factory StoryChapterModel({
    required String id,
    required int index,
    required ModelWithLang<String> title,
    required ModelWithLang<String> summary,
    required List<StoryPageModel> pages,
  }) = _StoryChapterModel;

  const StoryChapterModel._();

  factory StoryChapterModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
    required List<StoryPageModel> pages,
  }) {
    return StoryChapterModel(
      id: id,
      index: json[indexKey] as int,
      title: ModelWithLang.fromJson(json[titleKey] as Map<String, dynamic>),
      summary: ModelWithLang.fromJson(json[summaryKey] as Map<String, dynamic>),
      pages: pages,
    );
  }

  int get totalPages => pages.length;
  int get totalPageParts =>
      pages.map((e) => e.totalParts).fold(0, (a, b) => a + b);

  static const indexKey = 'index';
  static const titleKey = 'title';
  static const summaryKey = 'summary';
}
