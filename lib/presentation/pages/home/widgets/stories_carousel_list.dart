part of '../home_page.dart';

class _StoriesCarouselList extends StatelessWidget {
  const _StoriesCarouselList();

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
        children: List.generate(
          6,
          (index) {
            return GestureDetector(
              onTap: () {
                // TODO: navigate book detail

                context.router.push(const StoryDetailsRoute());
              },
              child: StoryGridCard(
                image:
                    NetworkImage('https://picsum.photos/200/300?random=$index'),
                title: 'The Little Prince',
                pagesCount: 100,
              ),
            );
          },
        ),
      ),
    );
  }
}
