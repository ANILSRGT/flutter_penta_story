part of 'story_details_page.dart';

class _StoryDetailsPageView extends StatefulWidget {
  const _StoryDetailsPageView();

  @override
  State<_StoryDetailsPageView> createState() => _StoryDetailsPageViewState();
}

class _StoryDetailsPageViewState extends State<_StoryDetailsPageView>
    with _StoryDetailsPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, cst) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: cst.maxHeight,
                ),
                child: Padding(
                  padding: context.ext.padding.horizontal.xl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          if (context.router.canPop()) const BackButton(),
                          const Spacer(),
                          AppLangDropdown.circle(
                            onChanged: (_) => setState(() {}),
                          ),
                        ],
                      ),
                      context.ext.sizedBox.height.xl,
                      Center(
                        child: SizedBox(
                          width: context.ext.screen.byOrientation(
                            portrait: context.ext.screen.width * 0.8,
                            landscape: context.ext.screen.height * 0.5,
                          ),
                          child: StoryBookImage.opened(
                            image: const NetworkImage(
                              'https://picsum.photos/200/300',
                            ),
                          ),
                        ),
                      ),
                      context.ext.sizedBox.height.xl3,
                      Text(
                        'The Little Prince',
                        textAlign: TextAlign.center,
                        style: context.ext.theme.textTheme.headlineMedium
                            ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Antoine de Saint-Exupéry',
                        textAlign: TextAlign.center,
                        style: context.ext.theme.textTheme.bodySmall,
                      ),
                      context.ext.sizedBox.height.md,
                      Text(
                        'Voluptate non in laborum deserunt velit minim sit do amet consectetur fugiat nostrud sunt veniam. Occaecat non eiusmod sunt pariatur quis non do incididunt. Fugiat exercitation ad quis minim velit velit sit deserunt laboris amet est pariatur. Eu eiusmod occaecat non.',
                        textAlign: TextAlign.center,
                        style: context.ext.theme.textTheme.bodyLarge,
                      ),
                      context.ext.sizedBox.height.xl3,
                      AppExpansionTile(
                        backgroundColor: context.appThemeExt.appColors.white
                            .byBrightness(context.ext.theme.isDark),
                        foregroundColor: context.appThemeExt.appColors.white
                            .byBrightness(context.ext.theme.isDark)
                            .onColor,
                        title: LocaleKeys.pagesStorySummaryTitle.translate,
                        content: [
                          Text(
                            'Tempor et deserunt esse do id eu nostrud. Eiusmod magna quis nostrud amet laboris veniam est fugiat sit in eu. Nostrud non consectetur cupidatat velit id ex officia.',
                            style: TextStyle(
                              color: context.appThemeExt.appColors.white
                                  .byBrightness(context.ext.theme.isDark)
                                  .onColor,
                            ),
                          ),
                        ],
                      ),
                      context.ext.sizedBox.height.xl3,
                      Row(
                        spacing: context.ext.values.lg,
                        children: [
                          Expanded(
                            child: AppElevatedButton(
                              onPressed: _onRead,
                              child: Text(
                                LocaleKeys.pagesStoryReadButtonLabel.translate,
                              ),
                            ),
                          ),
                          Expanded(
                            child: AppElevatedButton(
                              onPressed: _onListen,
                              child: Text(
                                LocaleKeys
                                    .pagesStoryListenButtonLabel.translate,
                              ),
                            ),
                          ),
                        ],
                      ),
                      context.ext.sizedBox.height.lg,
                    ],
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
