import 'package:mobx/mobx.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_new_all_usecase.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_popular_all_usecase.dart';
import 'package:penta_story/injection.dart';

part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store {
  @observable
  var _newStories = ObservableList<StoryModel>.of([]);
  @observable
  var _newStoriesLoading = false;

  @observable
  var _popularStories = ObservableList<StoryModel>.of([]);
  @observable
  var _popularStoriesLoading = false;

  @computed
  List<StoryModel> get newStories => _newStories.toList();
  @computed
  bool get newStoriesLoading => _newStoriesLoading;

  @computed
  List<StoryModel> get popularStories => _popularStories.toList();
  @computed
  bool get popularStoriesLoading => _popularStoriesLoading;

  @action
  Future<void> getNewStories() async {
    _newStoriesLoading = true;
    final response =
        await Injection.I.read<StoriesGetNewAllUsecase>().execute();
    response.whenOrNull(
      onSuccess: (data) => _newStories = ObservableList.of(data),
    );
    _newStoriesLoading = false;
  }

  @action
  Future<void> getPopularStories() async {
    _popularStoriesLoading = true;
    final response =
        await Injection.I.read<StoriesGetPopularAllUsecase>().execute();
    response.whenOrNull(
      onSuccess: (data) => _popularStories = ObservableList.of(data),
    );
    _popularStoriesLoading = false;
  }
}
