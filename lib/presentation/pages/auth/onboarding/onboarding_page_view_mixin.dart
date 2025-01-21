part of 'onboarding_page.dart';

mixin _OnboardingPageViewMixin on State<_OnboardingPageView> {
  final PageController _pageController = PageController();

  void _onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onBack() {
    if (_pageController.page! <= 0) return;
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onSkip(int lastIndex) {
    _pageController.animateToPage(
      lastIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onComplete() {
    context.router.replaceAll([const AuthenticationRoute()]);
  }
}
