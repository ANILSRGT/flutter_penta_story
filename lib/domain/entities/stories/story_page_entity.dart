import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_page_entity.freezed.dart';

@freezed
abstract class StoryPageEntity with _$StoryPageEntity {
  const factory StoryPageEntity({
    required String image,
  }) = _StoryPageEntity;
}
