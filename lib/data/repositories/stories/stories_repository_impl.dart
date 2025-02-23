import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/stories/params/stories_get_all_with_query_params.dart';
import 'package:penta_story/data/models/stories/params/stories_get_by_id_params.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/data/sources/stories/stories_remote_source.dart';
import 'package:penta_story/domain/repositories/stories/stories_repository.dart';
import 'package:penta_story/injection.dart';

final class StoriesRepositoryImpl implements StoriesRepository {
  @override
  Future<ResponseModel<List<StoryModel>>> getStories() async {
    return Injection.I.read<StoriesRemoteSource>().getStories();
  }

  @override
  Future<ResponseModel<StoryModel>> getStoryById(
    StoriesGetByIdParams params,
  ) async {
    return Injection.I.read<StoriesRemoteSource>().getStoryById(params);
  }

  @override
  Future<ResponseModel<List<StoryModel>>> getNewStories() async {
    return Injection.I.read<StoriesRemoteSource>().getNewStories();
  }

  @override
  Future<ResponseModel<List<StoryModel>>> getPopularStories() async {
    return Injection.I.read<StoriesRemoteSource>().getPopularStories();
  }

  @override
  Future<ResponseModel<List<StoryModel>>> getStoriesWithQuery(
    StoriesGetAllWithQueryParams params,
  ) {
    return Injection.I.read<StoriesRemoteSource>().getStoriesWithQuery(params);
  }
}
