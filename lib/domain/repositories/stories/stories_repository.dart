import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/stories/params/stories_get_all_with_query_params.dart';
import 'package:penta_story/data/models/stories/params/stories_get_by_id_params.dart';
import 'package:penta_story/data/models/stories/story_model.dart';

abstract class StoriesRepository {
  Future<ResponseModel<List<StoryModel>>> getStories();
  Future<ResponseModel<List<StoryModel>>> getStoriesWithQuery(
    StoriesGetAllWithQueryParams params,
  );
  Future<ResponseModel<StoryModel>> getStoryById(StoriesGetByIdParams params);
  Future<ResponseModel<List<StoryModel>>> getNewStories();
  Future<ResponseModel<List<StoryModel>>> getPopularStories();
}
