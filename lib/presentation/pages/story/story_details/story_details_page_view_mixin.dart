part of 'story_details_page.dart';

mixin _StoryDetailsPageViewMixin on State<_StoryDetailsPageView> {
  void _onRead() {
    // TODO: navigate read

    context.router.push(const StoryBookRoute());
  }

  void _onListen() {
    // TODO: navigate listen
  }
}
