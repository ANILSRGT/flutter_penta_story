part of '../home_page.dart';

class _StoriesCarouselList extends StatelessWidget {
  const _StoriesCarouselList({
    required this.stories,
  });

  final List<StoryModel> stories;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 250),
      child: CarouselView.weighted(
        flexWeights:
            List.generate(context.ext.screen.width ~/ 150, (index) => 2)
              ..removeLast()
              ..add(1),
        itemSnapping: true,
        backgroundColor: Colors.transparent,
        enableSplash: false,
        children: stories.map(
          (story) {
            return GestureDetector(
              onTap: () {
                context.router.push(
                  StoryDetailsRoute(
                    args: StoryDetailsPageArgs(story: story),
                  ),
                );
              },
              child: StoryGridCard(
                image: story.image,
                title: story.title.data(context) ?? '',
                pagesCount: story.totalPages,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
