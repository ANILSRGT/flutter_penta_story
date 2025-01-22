import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/stories/params/stories_get_by_id_params.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/domain/repositories/stories/stories_repository.dart';
import 'package:penta_story/injection.dart';

final class StoriesGetByIdUsecase
    implements IUseCaseWithParams<StoryModel, StoriesGetByIdParams> {
  @override
  Future<ResponseModel<StoryModel>> execute(
    StoriesGetByIdParams params,
  ) async {
    return Injection.I.read<StoriesRepository>().getStoryById(params);
  }
}
