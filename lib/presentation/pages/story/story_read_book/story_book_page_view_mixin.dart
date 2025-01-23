part of 'story_book_page.dart';

mixin _StoryBookPageViewMixin on State<_StoryBookPageView> {
  final FlutterTts _flutterTts = FlutterTts();

  int _currentChapter = 0;
  bool _isInitial = true;
  int _currentChapterPage = 0;
  int _currentChapterPagePart = 0;
  int _currentIndex = 0;

  int get _maxChapter => widget.args.story.chapters.length;
  int get _maxChapterPage => widget.args.story.chapters
      .firstWhere((e) => e.index == _currentChapter)
      .pages
      .length;
  int get _maxChapterPagePart => widget.args.story.chapters
      .firstWhere((e) => e.index == _currentChapter)
      .pages
      .firstWhere((e) => e.index == _currentChapterPage)
      .parts
      .length;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.args.bookType == StoryBookTypes.listen) {
        _initTts();
      }
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  Future<void> _initTts() async {
    final currentLang = AppLocaliaztionsEnum.fromLocale(context.locale);
    await _flutterTts.setLanguage(
      '${currentLang.languageCode}-${currentLang.countryCode}',
    );

    if (!mounted) return;
    _flutterTts.setCompletionHandler(() async {
      if (_currentChapter == _maxChapter - 1 &&
          _currentChapterPage == _maxChapterPage - 1 &&
          _currentChapterPagePart == _maxChapterPagePart - 1) {
        await _stopSpeaking();
        return;
      }
      await Future.delayed(Durations.extralong4, () {});
      _nextPart();
      await _speaking(
        (_currentChapterPage == 0) && (_currentChapterPagePart == 0)
            ? '$_currentChapterTitle, $_currentChapterPagePartContent'
            : _currentChapterPagePartContent,
      );
    });
    if (!mounted) return;
    await _speaking(widget.args.story.title.data(context) ?? '');
  }

  String get _currentChapterTitle =>
      widget.args.story.chapters
          .firstWhere((e) => e.index == _currentChapter)
          .title
          .data(context) ??
      '';

  String get _currentChapterPagePartContent =>
      widget.args.story.chapters
          .firstWhere((e) => e.index == _currentChapter)
          .pages
          .firstWhere((e) => e.index == _currentChapterPage)
          .parts
          .firstWhere((e) => e.index == _currentChapterPagePart)
          .content
          .data(context) ??
      '';

  Future<void> _speaking(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> _stopSpeaking() async {
    await _flutterTts.pause();
  }

  void _nextPart() {
    if (!mounted) return;
    if (_isInitial) {
      setState(() {
        _isInitial = false;
        _currentIndex++;
      });
    } else if (_currentChapterPagePart < _maxChapterPagePart - 1) {
      setState(() {
        _currentChapterPagePart++;
        _currentIndex++;
      });
    } else if (_currentChapterPage < _maxChapterPage - 1) {
      setState(() {
        _currentChapterPage++;
        _currentChapterPagePart = 0;
        _currentIndex++;
      });
    } else if (_currentChapter < _maxChapter - 1) {
      setState(() {
        _currentChapter++;
        _currentChapterPage = 0;
        _currentChapterPagePart = 0;
        _currentIndex++;
      });
    }
  }

  void _previousPart() {
    if (!mounted) return;
    if (_currentChapterPagePart > 0) {
      setState(() {
        _currentChapterPagePart--;
        _currentIndex--;
      });
    } else if (_currentChapterPage > 0) {
      setState(() {
        _currentChapterPage--;
        _currentChapterPagePart = _maxChapterPagePart - 1;
        _currentIndex--;
      });
    } else if (_currentChapter > 0) {
      setState(() {
        _currentChapter--;
        _currentChapterPage = _maxChapterPage - 1;
        _currentChapterPagePart = _maxChapterPagePart - 1;
        _currentIndex--;
      });
    } else if (!_isInitial) {
      setState(() {
        _isInitial = true;
        _currentIndex--;
      });
    }
  }
}
