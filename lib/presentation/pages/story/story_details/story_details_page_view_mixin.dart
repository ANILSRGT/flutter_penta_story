part of 'story_details_page.dart';

mixin _StoryDetailsPageViewMixin on State<_StoryDetailsPageView> {
  void _onRead() {
    context.router.push(
      StoryBookRoute(
        args: StoryBookPageArgs(story: widget.args.story),
      ),
    );
  }

  void _onListen() {
    // TODO: navigate listen
  }
}
