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
      body: ImageStringConverter.imageProviderBuilder(
        image: widget.args.story.chapters
            .firstWhere((e) => e.index == _currentChapter)
            .pages
            .firstWhere((e) => e.index == _currentChapterPage)
            .image,
        builder: (imageProvider) => DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.black38,
                BlendMode.darken,
              ),
            ),
          ),
          child: _bodyContent(context),
        ),
        onError: _bodyContent(context),
      ),
    );
  }

  SafeArea _bodyContent(BuildContext context) {
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
                        Row(
                          spacing: context.ext.values.sm,
                          children: [
                            if (context.router.canPop())
                              BackButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    context.appThemeExt.appColors.primary,
                                  ),
                                  foregroundColor: WidgetStateProperty.all(
                                    context
                                        .appThemeExt.appColors.primary.onColor,
                                  ),
                                ),
                              ),
                            const Spacer(),
                            AppLangDropdown.circle(
                              onChanged: (_) => setState(() {}),
                            ),
                          ],
                        ),
                        context.ext.sizedBox.height.xl3,
                        Text(
                          widget.args.story.title.data(context) ?? '',
                          textAlign: TextAlign.center,
                          style: context.ext.theme.textTheme.headlineMedium
                              ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.args.story.chapters
                                  .firstWhere((e) => e.index == _currentChapter)
                                  .title
                                  .data(context) ??
                              '',
                          textAlign: TextAlign.center,
                          style:
                              context.ext.theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        context.ext.sizedBox.height.xl3,
                        IntrinsicHeight(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 600,
                            ),
                            child: Text(
                              widget.args.story.chapters
                                      .firstWhere(
                                        (e) => e.index == _currentChapter,
                                      )
                                      .pages
                                      .firstWhere(
                                        (e) => e.index == _currentChapterPage,
                                      )
                                      .parts
                                      .firstWhere(
                                        (e) =>
                                            e.index == _currentChapterPagePart,
                                      )
                                      .content
                                      .data(context) ??
                                  '',
                              textAlign: TextAlign.center,
                              style: context.ext.theme.textTheme.bodyLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        context.ext.sizedBox.height.xl3,
                        const Spacer(),
                        Padding(
                          padding: context.ext.padding.horizontal.xl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: context.ext.values.md,
                            children: [
                              GestureDetector(
                                onTap: _currentChapter == 0 &&
                                        _currentChapterPage == 0 &&
                                        _currentChapterPagePart == 0
                                    ? null
                                    : _previousPart,
                                child: CircleAvatar(
                                  backgroundColor: _currentChapter == 0 &&
                                          _currentChapterPage == 0 &&
                                          _currentChapterPagePart == 0
                                      ? context.appThemeExt.appColors.grey
                                      : context.appThemeExt.appColors.white
                                          .byBrightness(
                                          context.ext.theme.isDark,
                                        ),
                                  foregroundColor: _currentChapter == 0 &&
                                          _currentChapterPage == 0 &&
                                          _currentChapterPagePart == 0
                                      ? context
                                          .appThemeExt.appColors.grey.onColor
                                      : context.appThemeExt.appColors.white
                                          .byBrightness(
                                            context.ext.theme.isDark,
                                          )
                                          .onColor,
                                  child: const Icon(AppIcons.chevronLeft),
                                ),
                              ),
                              GestureDetector(
                                onTap: _currentChapter == _maxChapter &&
                                        _currentChapterPage ==
                                            _maxChapterPage &&
                                        _currentChapterPagePart ==
                                            _maxChapterPagePart
                                    ? null
                                    : _nextPart,
                                child: CircleAvatar(
                                  backgroundColor:
                                      _currentChapter == _maxChapter &&
                                              _currentChapterPage ==
                                                  _maxChapterPage &&
                                              _currentChapterPagePart ==
                                                  _maxChapterPagePart
                                          ? context.appThemeExt.appColors.grey
                                          : context.appThemeExt.appColors.white
                                              .byBrightness(
                                              context.ext.theme.isDark,
                                            ),
                                  foregroundColor:
                                      _currentChapter == _maxChapter &&
                                              _currentChapterPage ==
                                                  _maxChapterPage &&
                                              _currentChapterPagePart ==
                                                  _maxChapterPagePart
                                          ? context.appThemeExt.appColors.grey
                                              .onColor
                                          : context.appThemeExt.appColors.white
                                              .byBrightness(
                                                context.ext.theme.isDark,
                                              )
                                              .onColor,
                                  child: const Icon(AppIcons.chevronRight),
                                ),
                              ),
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
}
