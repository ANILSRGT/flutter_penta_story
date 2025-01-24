part of 'story_book_page.dart';

class _StoryBookPageView extends StatefulWidget {
  const _StoryBookPageView({
    required this.args,
  });

  final StoryBookPageArgs args;

  @override
  State<_StoryBookPageView> createState() => _StoryBookPageViewState();
}

class _StoryBookPageViewState extends State<_StoryBookPageView>
    with _StoryBookPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ImageStringConverter.imageProviderBuilder(
      image: _isInitial ? widget.args.story.image : _currentChapterPage.image,
      builder: (imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
        ),
        child: _bodyReadContent(context),
      ),
      onError: _bodyReadContent(context),
    );
  }

  SafeArea _bodyReadContent(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: LayoutBuilder(
          builder: (_, cst) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: cst.maxHeight),
                child: Padding(
                  padding: context.ext.padding.horizontal.lg,
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        context.ext.sizedBox.height.md,
                        _buildAppbar(context),
                        context.ext.sizedBox.height.xl3,
                        if (_isInitial) ...[
                          const Spacer(),
                          _storyTitle(context),
                          if (widget.args.bookType ==
                              StoryBookTypes.listen) ...[
                            context.ext.sizedBox.height.xl3,
                            const Center(child: AppLoadingIndicator()),
                          ],
                        ],
                        if (!_isInitial) ...[
                          _chapterTitle(context),
                          const Spacer(),
                          context.ext.sizedBox.height.xl3,
                          IntrinsicHeight(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 600,
                              ),
                              child: _pagePartContent(context),
                            ),
                          ),
                        ],
                        context.ext.sizedBox.height.xl3,
                        const Spacer(),
                        Visibility(
                          visible: !_isInitial,
                          child: _chapterSummary(context),
                        ),
                        context.ext.sizedBox.height.xl3,
                        Padding(
                          padding: context.ext.padding.horizontal.xl,
                          child: Row(
                            spacing: context.ext.values.md,
                            children: [
                              if (widget.args.bookType == StoryBookTypes.read)
                                _prevButton(context),
                              const Spacer(),
                              _chapterPart(context),
                              const Spacer(),
                              if (widget.args.bookType == StoryBookTypes.read)
                                _nextButton(context),
                            ],
                          ),
                        ),
                        context.ext.sizedBox.height.xl,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Row _buildAppbar(BuildContext context) {
    return Row(
      spacing: context.ext.values.sm,
      children: [
        if (context.router.canPop())
          BackButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                context.appThemeExt.appColors.primary,
              ),
              foregroundColor: WidgetStateProperty.all(
                context.appThemeExt.appColors.primary.onColor,
              ),
            ),
          ),
        const Spacer(),
        AppLangDropdown.circle(
          onChanged: _onChangedLang,
        ),
      ],
    );
  }

  Text _storyTitle(BuildContext context) {
    return Text(
      widget.args.story.title.data(context) ?? '',
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Text _chapterTitle(BuildContext context) {
    return Text(
      _currentChapter.title.data(context) ?? '',
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget _chapterSummary(BuildContext context) {
    final descColor = context.ext.theme.convertByBrightness(
      light: context.appThemeExt.appColors.lightGrey,
      dark: context.appThemeExt.appColors.darkGrey,
    );
    return AppExpansionTile(
      backgroundColor: descColor,
      foregroundColor: descColor.onColor,
      title: LocaleKeys.pagesStoryBookChapterSummary.translate,
      content: [
        Text(
          _currentChapter.summary.data(context) ?? '',
          textAlign: TextAlign.center,
          style: context.ext.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: descColor.onColor,
          ),
        ),
      ],
    );
  }

  Text _pagePartContent(BuildContext context) {
    return Text(
      _currentChapterPagePart.content.data(context) ?? '',
      textAlign: TextAlign.center,
      style: context.ext.theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  GestureDetector _prevButton(BuildContext context) {
    return GestureDetector(
      onTap: _currentChapterIndex == 0 &&
              _currentChapterPageIndex == 0 &&
              _currentChapterPagePartIndex == 0 &&
              _isInitial
          ? null
          : _previousPart,
      child: CircleAvatar(
        backgroundColor: _currentChapterIndex == 0 &&
                _currentChapterPageIndex == 0 &&
                _currentChapterPagePartIndex == 0 &&
                _isInitial
            ? context.ext.theme.convertByBrightness(
                light: context.appThemeExt.appColors.grey,
                dark: context.appThemeExt.appColors.darkGrey,
              )
            : context.appThemeExt.appColors.white.byBrightness(
                context.ext.theme.isDark,
              ),
        foregroundColor: _currentChapterIndex == 0 &&
                _currentChapterPageIndex == 0 &&
                _currentChapterPagePartIndex == 0 &&
                _isInitial
            ? context.ext.theme
                .convertByBrightness(
                  light: context.appThemeExt.appColors.grey,
                  dark: context.appThemeExt.appColors.darkGrey,
                )
                .onColor
            : context.appThemeExt.appColors.white
                .byBrightness(
                  context.ext.theme.isDark,
                )
                .onColor,
        child: const Icon(AppIcons.chevronLeft),
      ),
    );
  }

  Visibility _chapterPart(BuildContext context) {
    return Visibility(
      visible: !_isInitial,
      child: CircleAvatar(
        backgroundColor: context.appThemeExt.appColors.background
            .byBrightness(context.ext.theme.isDark),
        foregroundColor: context.appThemeExt.appColors.background
            .byBrightness(context.ext.theme.isDark)
            .onColor,
        child: Text(
          _chaptersPagesParts
              .expand((e) => e)
              .expand((e) => e)
              .toList()
              .indexOf(_currentChapterPagePart)
              .toString(),
          textAlign: TextAlign.center,
          style: context.ext.theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  GestureDetector _nextButton(BuildContext context) {
    return GestureDetector(
      onTap: _currentChapterIndex == _maxChapters - 1 &&
              _currentChapterPageIndex == _maxCurrentPages - 1 &&
              _currentChapterPagePartIndex == _maxCurrentParts - 1
          ? null
          : _nextPart,
      child: CircleAvatar(
        backgroundColor: _currentChapterIndex == _maxChapters - 1 &&
                _currentChapterPageIndex == _maxCurrentPages - 1 &&
                _currentChapterPagePartIndex == _maxCurrentParts - 1
            ? context.ext.theme.convertByBrightness(
                light: context.appThemeExt.appColors.grey,
                dark: context.appThemeExt.appColors.darkGrey,
              )
            : context.appThemeExt.appColors.white.byBrightness(
                context.ext.theme.isDark,
              ),
        foregroundColor: _currentChapterIndex == _maxChapters - 1 &&
                _currentChapterPageIndex == _maxCurrentPages - 1 &&
                _currentChapterPagePartIndex == _maxCurrentParts - 1
            ? context.ext.theme
                .convertByBrightness(
                  light: context.appThemeExt.appColors.grey,
                  dark: context.appThemeExt.appColors.darkGrey,
                )
                .onColor
            : context.appThemeExt.appColors.white
                .byBrightness(
                  context.ext.theme.isDark,
                )
                .onColor,
        child: const Icon(AppIcons.chevronRight),
      ),
    );
  }
}
