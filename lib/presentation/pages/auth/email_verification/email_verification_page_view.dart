part of 'email_verification_page.dart';

class _EmailVerificationPageView extends StatefulWidget {
  const _EmailVerificationPageView();

  @override
  State<_EmailVerificationPageView> createState() =>
      _EmailVerificationPageViewState();
}

class _EmailVerificationPageViewState extends State<_EmailVerificationPageView>
    with _EmailVerificationPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppLangDropdown.circle(
          onChanged: (_) => setState(() {}),
        ),
        actions: [
          LogoutButton.icon(),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: context.ext.padding.horizontal.xl,
              child: Column(
                children: [
                  context.ext.sizedBox.height.xl,
                  SizedBox(
                    height: context.ext.screen.byOrientation(
                      portrait: context.ext.screen.width * 0.4,
                      landscape: context.ext.screen.height * 0.2,
                    ),
                    child: SvgPicture.asset(
                      AppVectors.mailbox,
                    ),
                  ),
                  context.ext.sizedBox.height.xl2,
                  Text(
                    LocaleKeys.pagesEmailVerificationTitle.translate,
                    textAlign: TextAlign.center,
                    style: context.ext.theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  context.ext.sizedBox.height.xs,
                  Text(
                    LocaleKeys.pagesEmailVerificationDescription.translate,
                    textAlign: TextAlign.center,
                    style: context.ext.theme.textTheme.bodyLarge,
                  ),
                  context.ext.sizedBox.height.xl6,
                  AppElevatedButton(
                    onPressed: _emailCheck,
                    child: Text(
                      LocaleKeys
                          .pagesEmailVerificationResendButtonLabel.translate,
                    ),
                  ),
                  context.ext.sizedBox.height.xl,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
