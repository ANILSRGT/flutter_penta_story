import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:penta_story/data/models/stories/story_page_part_model.dart';

part 'story_page_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class StoryPageModel with _$StoryPageModel {
  const factory StoryPageModel({
    required String id,
    required int index,
    required String image,
    required List<StoryPagePartModel> parts,
  }) = _StoryPageModel;

  const StoryPageModel._();

  factory StoryPageModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
    required List<StoryPagePartModel> parts,
  }) {
    return StoryPageModel(
      id: id,
      index: json[indexKey] as int,
      image: json[imageKey] as String,
      parts: parts,
    );
  }

  int get totalParts => parts.length;

  static const indexKey = 'index';
  static const imageKey = 'image';
}
