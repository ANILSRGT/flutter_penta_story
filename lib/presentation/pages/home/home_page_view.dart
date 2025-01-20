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
        child: SingleChildScrollView(
          child: Padding(
            padding: context.ext.padding.horizontal.xl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProfileAvatarWidget(imageData: null),
                    AppLangDropdown.circle(
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ),
                context.ext.sizedBox.height.xl,
                AppSearchAnchor(
                  hintText: 'Explore stories and authors',
                  reverseColor: true,
                  suggestionsBuilder: (p0) {
                    return [
                      ListTile(
                        onTap: () {},
                        leading: const StoryBookImage(
                          image: NetworkImage('https://picsum.photos/200/300'),
                        ),
                        title: const Text('Story 1'),
                        subtitle: const Text('Author 1'),
                      ),
                    ];
                  },
                ),
                context.ext.sizedBox.height.xl,
                TitleText(LocaleKeys.pagesHomeNewStoriesTitle.translate),
                context.ext.sizedBox.height.md,
                const _StoriesCarouselList(),
                context.ext.sizedBox.height.xl,
                TitleText(LocaleKeys.pagesHomePopularStoriesTitle.translate),
                context.ext.sizedBox.height.md,
                const _StoriesGridList(),
                context.ext.sizedBox.height.xl,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
