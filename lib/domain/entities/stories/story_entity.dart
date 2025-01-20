import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_entity.freezed.dart';

@freezed
abstract class StoryEntity with _$StoryEntity {
  const factory StoryEntity({
    required String title,
    required String author,
    required String description,
    required String summary,
    required String image,
    required int year,
  }) = _StoryEntity;
}
