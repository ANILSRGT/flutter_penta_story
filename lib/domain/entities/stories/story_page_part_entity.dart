import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_page_part_entity.freezed.dart';

@freezed
abstract class StoryPagePartEntity with _$StoryPagePartEntity {
  const factory StoryPagePartEntity({
    required String content,
  }) = _StoryPagePartEntity;
}
