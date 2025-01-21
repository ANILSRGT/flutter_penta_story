import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/stories/params/stories_get_by_id_params.dart';
import 'package:penta_story/data/models/stories/story_entity.dart';

abstract class StoriesRepository {
  Future<ResponseModel<List<StoryModel>>> getStories();
  Future<ResponseModel<StoryModel>> getStoryById(StoriesGetByIdParams params);
}
