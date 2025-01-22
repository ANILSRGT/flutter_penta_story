part of 'home_page.dart';

mixin _HomePageViewMixin on State<_HomePageView> {
  final _viewModel = HomePageViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  void init() {
    _viewModel
      ..getNewStories()
      ..getPopularStories();
  }

  void _onProfileAvatarTap() {
    context.router.push(const ProfileRoute());
  }

  Future<ResponseModel<List<StoryModel>>> _searchStories(String query) async {
    final response =
        await Injection.I.read<StoriesGetAllWithQueryUsecase>().execute(
              StoriesGetAllWithQueryParams(
                lang: AppLocaliaztionsEnum.fromLocale(context.locale),
                title: query,
                author: query,
              ),
            );
    return response;
  }
}
