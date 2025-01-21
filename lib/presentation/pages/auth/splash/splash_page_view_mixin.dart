part of 'splash_page.dart';

mixin _SplashPageViewMixin on State<_SplashPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  Future<void> _init() async {
    await LocalizationManager.I.init(context);

    final isFirstTime =
        AppCache.I.getOrDefault<bool>(AppCacheKeysEnum.firstTime, true);
    await AppCache.I.put(AppCacheKeysEnum.firstTime, false);

    if (!mounted) return;

    if (isFirstTime) {
      return context.router.replaceAll([const OnboardingRoute()]);
    }

    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null) {
      return context.router.replaceAll([const AuthenticationRoute()]);
    }

    final userResult = await Injection.I
        .read<UsersGetUserByIdUsecase>()
        .execute(UsersGetUserByIdParams(id: authUser.uid));

    if (!mounted) return;

    if (userResult.isSuccess) {
      context.read<UserNotifier>().setUser(userResult.asSuccess.data);
    } else {
      await Injection.I.read<AuthSignOutUsecase>().execute();
    }

    if (!mounted) return;

    await context.router.replaceAll([const AuthenticationRoute()]);
  }
}
