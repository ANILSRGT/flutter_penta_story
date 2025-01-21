final class FirestorePaths {
  const FirestorePaths._();

  static String storyChapters({
    required String storyId,
  }) {
    return 'stories/$storyId/chapters';
  }

  static const stories = 'stories';

  static String storyPages({
    required String storyId,
    required String chapterId,
  }) {
    return 'stories/$storyId/chapters/$chapterId/pages';
  }

  static String storyPageParts({
    required String storyId,
    required String chapterId,
    required String pageId,
  }) {
    return 'stories/$storyId/chapters/$chapterId/pages/$pageId/parts';
  }

  static const users = 'users';
}
