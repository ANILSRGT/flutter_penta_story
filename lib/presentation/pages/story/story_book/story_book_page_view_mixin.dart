part of 'story_book_page.dart';

mixin _StoryBookPageViewMixin on State<_StoryBookPageView> {
  final FlutterTts _flutterTts = FlutterTts();
  late final _chaptersPagesParts = widget.args.story.chapters
      .map(
        (e) => e.pages.ext.sorter
            .orderWithData(
              (prev, current) => prev.index.compareTo(current.index),
            )
            .map(
              (e) => e.parts.ext.sorter.orderWithData(
                (prev, current) => prev.index.compareTo(current.index),
              ),
            )
            .toList(),
      )
      .toList();

  bool _isInitial = true;
  int _currentChapterIndex = 0;
  int _currentChapterPageIndex = 0;
  int _currentChapterPagePartIndex = 0;

  int get _maxChapters => _chaptersPagesParts.length;
  int get _maxCurrentPages => _chaptersPagesParts[_currentChapterIndex].length;
  int get _maxCurrentParts =>
      _chaptersPagesParts[_currentChapterIndex][_currentChapterPageIndex]
          .length;

  StoryChapterModel get _currentChapter =>
      widget.args.story.chapters.ext.sorter.orderWithData(
        (prev, current) => prev.index.compareTo(current.index),
      )[_currentChapterIndex];
  StoryPageModel get _currentChapterPage =>
      _currentChapter.pages.ext.sorter.orderWithData(
        (prev, current) => prev.index.compareTo(current.index),
      )[_currentChapterPageIndex];
  StoryPagePartModel get _currentChapterPagePart =>
      _currentChapterPage.parts.ext.sorter.orderWithData(
        (prev, current) => prev.index.compareTo(current.index),
      )[_currentChapterPagePartIndex];

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
      if (_currentChapterIndex == _maxChapters - 1 &&
          _currentChapterPageIndex == _maxCurrentPages - 1 &&
          _currentChapterPagePartIndex == _maxCurrentParts - 1) {
        await _stopSpeaking();
        return;
      }
      await Future.delayed(Durations.extralong4, () {});
      _nextPart();
      await _speakingCurrent();
    });
    if (!mounted) return;
    await _speaking(widget.args.story.title.data(context) ?? '');
  }

  Future<void> _speakingCurrent() async {
    return _speaking(
      (_currentChapterPageIndex == 0) && (_currentChapterPagePartIndex == 0)
          ? '${_currentChapter.title.data(context) ?? ''}, ${_currentChapterPagePart.content.data(context) ?? ''}'
          : _currentChapterPagePart.content.data(context) ?? '',
    );
  }

  Future<void> _speaking(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> _stopSpeaking() async {
    await _flutterTts.stop();
  }

  Future<void> _onChangedLang(AppLocaliaztionsEnum value) async {
    if (widget.args.bookType == StoryBookTypes.read) {
      setState(() {});
      return;
    }
    await context.showLoadingDialog(
      future: () async {
        await _flutterTts.stop();
        await _flutterTts.setLanguage(
          '${value.languageCode}-${value.countryCode}',
        );
      },
      callback: (_) {
        setState(() {});
        _speakingCurrent();
      },
    );
  }

  void _nextPart() {
    if (!mounted) return;
    if (_isInitial) {
      setState(() {
        _isInitial = false;
        _currentChapterPagePartIndex++;
      });
    } else if (_currentChapterPagePartIndex < _maxCurrentParts - 1) {
      setState(() {
        _currentChapterPagePartIndex++;
      });
    } else if (_currentChapterPageIndex < _maxCurrentPages - 1) {
      setState(() {
        _currentChapterPageIndex++;
        _currentChapterPagePartIndex = 0;
      });
    } else if (_currentChapterIndex < _maxChapters - 1) {
      setState(() {
        _currentChapterIndex++;
        _currentChapterPageIndex = 0;
        _currentChapterPagePartIndex = 0;
      });
    }
  }

  void _previousPart() {
    if (!mounted) return;
    if (!_isInitial) {
      setState(() {
        _isInitial = true;
        _currentChapterPagePartIndex = 0;
      });
    } else if (_currentChapterPagePartIndex > 0) {
      setState(() {
        _currentChapterPagePartIndex--;
      });
    } else if (_currentChapterPageIndex > 0) {
      setState(() {
        _currentChapterPageIndex--;
        _currentChapterPagePartIndex = _maxCurrentParts - 1;
      });
    } else if (_currentChapterIndex > 0) {
      setState(() {
        _currentChapterIndex--;
        _currentChapterPageIndex = _maxCurrentPages - 1;
        _currentChapterPagePartIndex = _chaptersPagesParts[_currentChapterIndex]
                    [_currentChapterPageIndex]
                .length -
            1;
      });
    }
  }
}
