import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/stories/story_entity.dart';
import 'package:penta_story/domain/repositories/stories/stories_repository.dart';
import 'package:penta_story/injection.dart';

final class StoriesGetPopularAllUsecase implements IUseCase<List<StoryModel>> {
  @override
  Future<ResponseModel<List<StoryModel>>> execute() async {
    return Injection.I.read<StoriesRepository>().getPopularStories();
  }
}
