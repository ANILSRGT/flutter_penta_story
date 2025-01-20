part of 'splash_page.dart';

mixin _SplashPageViewMixin on State<_SplashPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  Future<void> _init() async {
    await LocalizationManager.I.init(context);

    if (!mounted) return;
    unawaited(context.router.replaceAll([const OnboardingRoute()]));
  }
}
