part of '../home_page.dart';

class _StoriesGridList extends StatelessWidget {
  const _StoriesGridList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 125 / 150,
        crossAxisSpacing: context.ext.values.sm,
        mainAxisSpacing: context.ext.values.sm,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // TODO: navigate book detail

            context.router.push(const StoryDetailsRoute());
          },
          child: StoryGridCard(
            image: NetworkImage('https://picsum.photos/200/300?random=$index'),
            title: 'The Little Prince',
            pagesCount: 100,
          ),
        );
      },
    );
  }
}
