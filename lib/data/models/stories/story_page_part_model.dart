import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penta_story/data/models/others/model_with_lang.dart';

part 'story_page_part_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class StoryPagePartModel with _$StoryPagePartModel {
  const factory StoryPagePartModel({
    required String id,
    required int index,
    required ModelWithLang<String> content,
  }) = _StoryPagePartModel;

  const StoryPagePartModel._();

  factory StoryPagePartModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) =>
      StoryPagePartModel(
        id: id,
        index: json[indexKey] as int,
        content:
            ModelWithLang.fromJson(json[contentKey] as Map<String, String>),
      );

  static const indexKey = 'index';
  static const contentKey = 'content';
}
