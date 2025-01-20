import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_chapter_entity.freezed.dart';

@freezed
abstract class StoryChapterEntity with _$StoryChapterEntity {
  const factory StoryChapterEntity({
    required String title,
    required String description,
  }) = _StoryChapterEntity;
}
