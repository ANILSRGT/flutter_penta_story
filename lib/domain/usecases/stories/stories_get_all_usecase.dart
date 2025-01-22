import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/stories/params/stories_get_all_with_query_params.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/domain/repositories/stories/stories_repository.dart';
import 'package:penta_story/injection.dart';

final class StoriesGetAllUsecase implements IUseCase<List<StoryModel>> {
  @override
  Future<ResponseModel<List<StoryModel>>> execute() async {
    return Injection.I.read<StoriesRepository>().getStories();
  }
}

final class StoriesGetAllWithQueryUsecase
    implements
        IUseCaseWithParams<List<StoryModel>, StoriesGetAllWithQueryParams> {
  @override
  Future<ResponseModel<List<StoryModel>>> execute(
    StoriesGetAllWithQueryParams params,
  ) async {
    return Injection.I.read<StoriesRepository>().getStoriesWithQuery(params);
  }
}
