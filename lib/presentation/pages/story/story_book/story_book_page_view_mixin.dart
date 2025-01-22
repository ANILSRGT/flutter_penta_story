part of 'story_book_page.dart';

mixin _StoryBookPageViewMixin on State<_StoryBookPageView> {
  int _currentChapter = 0;
  int _currentChapterPage = 0;
  int _currentChapterPagePart = 0;

  int get _maxChapter => widget.args.story.chapters.length - 1;
  int get _maxChapterPage =>
      widget.args.story.chapters[_currentChapter].pages.length - 1;
  int get _maxChapterPagePart =>
      widget.args.story.chapters[_currentChapter].pages[_currentChapterPage]
          .parts.length -
      1;

  void _previousPart() {
    if (_currentChapter == 0 &&
        _currentChapterPage == 0 &&
        _currentChapterPagePart == 0) {
      return;
    }

    if (_currentChapterPagePart == 0) {
      if (_currentChapterPage == 0) {
        setState(() {
          _currentChapter--;
          _currentChapterPage =
              widget.args.story.chapters[_currentChapter].pages.length - 1;
          _currentChapterPagePart = widget.args.story.chapters[_currentChapter]
                  .pages[_currentChapterPage].parts.length -
              1;
        });
      } else {
        setState(() {
          _currentChapterPage--;
          _currentChapterPagePart = widget.args.story.chapters[_currentChapter]
                  .pages[_currentChapterPage].parts.length -
              1;
        });
      }
    } else {
      setState(() {
        _currentChapterPagePart--;
      });
    }
  }

  void _nextPart() {
    if (_currentChapter == _maxChapter &&
        _currentChapterPage == _maxChapterPage &&
        _currentChapterPagePart == _maxChapterPagePart) {
      return;
    }

    if (_currentChapterPagePart == _maxChapterPagePart) {
      if (_currentChapterPage == _maxChapterPage) {
        setState(() {
          _currentChapter++;
          _currentChapterPage = 0;
          _currentChapterPagePart = 0;
        });
      } else {
        setState(() {
          _currentChapterPage++;
          _currentChapterPagePart = 0;
        });
      }
    } else {
      setState(() {
        _currentChapterPagePart++;
      });
    }
  }
}
