part of '../home_page.dart';

class _StoriesGridList extends StatelessWidget {
  const _StoriesGridList({
    required this.stories,
  });

  final List<StoryModel> stories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: stories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 125 / 150,
        crossAxisSpacing: context.ext.values.sm,
        mainAxisSpacing: context.ext.values.sm,
      ),
      itemBuilder: (context, index) {
        final story = stories[index];
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
    );
  }
}
