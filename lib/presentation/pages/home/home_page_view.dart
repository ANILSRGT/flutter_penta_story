part of 'home_page.dart';

class _HomePageView extends StatefulWidget {
  const _HomePageView();

  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> with _HomePageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            init();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: context.ext.padding.horizontal.xl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileAvatarWidget(
                        imageData: context.watch<UserNotifier>().user?.image,
                        onTap: _onProfileAvatarTap,
                      ),
                      AppLangDropdown.circle(
                        onChanged: (_) => setState(() {}),
                      ),
                    ],
                  ),
                  context.ext.sizedBox.height.xl,
                  AppSearchAnchor(
                    hintText: LocaleKeys.pagesHomeSearchBarHint.translate,
                    reverseColor: true,
                    suggestionsBuilder: (p0) async {
                      final storiesRes = await _searchStories(p0);
                      return storiesRes.when(
                        onSuccess: (stories) => stories
                            .map(
                              (story) => ListTile(
                                onTap: () {
                                  context.router.push(
                                    StoryDetailsRoute(
                                      args: StoryDetailsPageArgs(story: story),
                                    ),
                                  );
                                },
                                leading: StoryBookImage(
                                  image: story.image,
                                ),
                                titleTextStyle: context
                                    .ext.theme.textTheme.bodyLarge
                                    ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                title: Text(story.title.data(context) ?? ''),
                                subtitle: Text(story.author),
                              ),
                            )
                            .toList(),
                        onSuccessNegative: (_, __) => [],
                        onFail: (fail) => [],
                      );
                    },
                  ),
                  context.ext.sizedBox.height.xl,
                  TitleText(LocaleKeys.pagesHomeNewStoriesTitle.translate),
                  context.ext.sizedBox.height.md,
                  Observer(
                    builder: (context) {
                      if (_viewModel.newStoriesLoading) {
                        return const Center(child: AppLoadingIndicator());
                      } else if (_viewModel.newStories.isEmpty) {
                        return Center(
                          child: Text(
                            LocaleKeys.pagesHomeNewStoriesNotFound.translate,
                          ),
                        );
                      } else {
                        return _StoriesCarouselList(
                          stories: _viewModel.newStories,
                        );
                      }
                    },
                  ),
                  context.ext.sizedBox.height.xl,
                  TitleText(LocaleKeys.pagesHomePopularStoriesTitle.translate),
                  context.ext.sizedBox.height.md,
                  Observer(
                    builder: (context) {
                      if (_viewModel.popularStoriesLoading) {
                        return const Center(child: AppLoadingIndicator());
                      } else if (_viewModel.popularStories.isEmpty) {
                        return Center(
                          child: Text(
                            LocaleKeys
                                .pagesHomePopularStoriesNotFound.translate,
                          ),
                        );
                      } else {
                        return _StoriesGridList(
                          stories: _viewModel.popularStories,
                        );
                      }
                    },
                  ),
                  context.ext.sizedBox.height.xl,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
