part of 'splash_page.dart';

class _SplashPageView extends StatefulWidget {
  const _SplashPageView();

  @override
  State<_SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<_SplashPageView>
    with _SplashPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(height: context.ext.screen.height * 0.05),
                const Spacer(),
                const AppLogo(),
                const Spacer(),
                const AppLoadingIndicator(),
                SizedBox(height: context.ext.screen.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
