part of 'story_book_page.dart';

class _StoryBookPageView extends StatefulWidget {
  const _StoryBookPageView();

  @override
  State<_StoryBookPageView> createState() => _StoryBookPageViewState();
}

class _StoryBookPageViewState extends State<_StoryBookPageView>
    with _StoryBookPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/1920/1080'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black38,
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
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
                              children: [
                                if (context.router.canPop())
                                  BackButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                        context.appThemeExt.appColors.primary,
                                      ),
                                      foregroundColor: WidgetStateProperty.all(
                                        context.appThemeExt.appColors.primary
                                            .onColor,
                                      ),
                                    ),
                                  ),
                                const Spacer(),
                                AppLangDropdown.circle(
                                  onChanged: (_) => setState(() {}),
                                ),
                              ],
                            ),
                            const Spacer(),
                            context.ext.sizedBox.height.xl3,
                            IntrinsicHeight(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 600,
                                ),
                                child: Text(
                                  'Dolore eu aute minim dolor excepteur minim eu cillum ut elit. Eiusmod elit sit nisi sunt proident duis quis reprehenderit aliqua incididunt sint. Aliqua officia dolor cillum incididunt commodo qui id ut.',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: context.ext.values.md,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: context
                                          .appThemeExt.appColors.white
                                          .byBrightness(
                                        context.ext.theme.isDark,
                                      ),
                                      foregroundColor:
                                          context.appThemeExt.appColors.white
                                              .byBrightness(
                                                context.ext.theme.isDark,
                                              )
                                              .onColor,
                                      child: const Icon(AppIcons.chevronLeft),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: context
                                          .appThemeExt.appColors.white
                                          .byBrightness(
                                        context.ext.theme.isDark,
                                      ),
                                      foregroundColor:
                                          context.appThemeExt.appColors.white
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
        ),
      ),
    );
  }
}
