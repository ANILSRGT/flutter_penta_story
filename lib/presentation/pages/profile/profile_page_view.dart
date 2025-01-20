part of 'profile_page.dart';

class _ProfilePageView extends StatefulWidget {
  const _ProfilePageView();

  @override
  State<_ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<_ProfilePageView>
    with _ProfilePageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.threeDotsVert),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: context.ext.padding.horizontal.xl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.ext.sizedBox.height.xl6,
                Center(
                  child: GestureDetector(
                    onTap: _pickProfileImage,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Observer(
                          builder: (_) => ProfileAvatarWidget(
                            imageData: _viewModel.profileImage,
                            radius: context.ext.screen.byOrientation(
                              portrait: context.ext.screen.width * 0.35,
                              landscape: context.ext.screen.height * 0.3,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -4,
                          bottom: -4,
                          child: CircleAvatar(
                            backgroundColor:
                                context.appThemeExt.appColors.primary.onColor,
                            foregroundColor:
                                context.appThemeExt.appColors.primary,
                            child: const Icon(AppIcons.camera),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                context.ext.sizedBox.height.xl3,
                Text(
                  'Full Name',
                  textAlign: TextAlign.center,
                  style: context.ext.theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '@username',
                  textAlign: TextAlign.center,
                  style: context.ext.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                context.ext.sizedBox.height.md,
                Card(
                  color: context.appThemeExt.appColors.white
                      .byBrightness(context.ext.theme.isDark),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: context.ext.radius.border.all.md,
                  ),
                  child: Padding(
                    padding: context.ext.padding.all.md,
                    child: Text(
                      'Fugiat proident eu labore ullamco culpa ad nisi cupidatat. Fugiat consectetur esse nostrud irure proident aliquip aliquip minim laborum sunt exercitation sunt est. Irure Lorem Lorem do dolor esse.',
                      style: context.ext.theme.textTheme.bodyLarge?.copyWith(
                        color: context.appThemeExt.appColors.white
                            .byBrightness(context.ext.theme.isDark)
                            .onColor,
                      ),
                    ),
                  ),
                ),
                context.ext.sizedBox.height.xl,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
