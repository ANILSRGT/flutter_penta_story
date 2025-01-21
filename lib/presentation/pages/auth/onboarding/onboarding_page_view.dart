part of 'onboarding_page.dart';

class _OnboardingPageView extends StatefulWidget {
  const _OnboardingPageView();

  @override
  State<_OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<_OnboardingPageView> {
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

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingPageItemData(
        image: SvgPicture.asset(AppVectors.welcome),
        title: LocaleKeys.pagesOnboardingItems1Title.translate,
        subtitle: LocaleKeys.pagesOnboardingItems1Subtitle.translate,
        description: LocaleKeys.pagesOnboardingItems1Description.translate,
      ),
      OnboardingPageItemData(
        image: SvgPicture.asset(AppVectors.readingBook),
        title: LocaleKeys.pagesOnboardingItems2Title.translate,
        subtitle: LocaleKeys.pagesOnboardingItems2Subtitle.translate,
        description: LocaleKeys.pagesOnboardingItems2Description.translate,
      ),
      OnboardingPageItemData(
        image: SvgPicture.asset(AppVectors.listening),
        title: LocaleKeys.pagesOnboardingItems3Title.translate,
        subtitle: LocaleKeys.pagesOnboardingItems3Subtitle.translate,
        description: LocaleKeys.pagesOnboardingItems3Description.translate,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (_, index) {
            return OnboardingPageItem(
              data: pages[index],
              index: index,
              maxIndex: pages.length - 1,
              onNext: _onNext,
              onBack: _onBack,
              onSkip: () => _onSkip(pages.length - 1),
              onComplete: _onComplete,
              onChangeLang: () => setState(() {}),
            );
          },
        ),
      ),
    );
  }
}
