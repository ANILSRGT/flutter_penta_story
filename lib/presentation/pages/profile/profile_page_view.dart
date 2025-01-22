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
        actions: const [
          AppPopupMenuButton<int>(
            items: [
              PopupMenuItem(
                child: LogoutButton(),
              ),
            ],
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
                            imageData:
                                context.watch<UserNotifier>().user?.image,
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
                  context.watch<UserNotifier>().user?.fullName ?? '',
                  textAlign: TextAlign.center,
                  style: context.ext.theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '@${context.watch<UserNotifier>().user?.username}',
                  textAlign: TextAlign.center,
                  style: context.ext.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                context.ext.sizedBox.height.md,
                Visibility(
                  visible: context.watch<UserNotifier>().user?.bio.isNotEmpty ??
                      false,
                  child: Card(
                    color: context.appThemeExt.appColors.white
                        .byBrightness(context.ext.theme.isDark),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: context.ext.radius.border.all.md,
                    ),
                    child: Padding(
                      padding: context.ext.padding.all.md,
                      child: Text(
                        context.watch<UserNotifier>().user?.bio ?? '',
                        style: context.ext.theme.textTheme.bodyLarge?.copyWith(
                          color: context.appThemeExt.appColors.white
                              .byBrightness(context.ext.theme.isDark)
                              .onColor,
                        ),
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
