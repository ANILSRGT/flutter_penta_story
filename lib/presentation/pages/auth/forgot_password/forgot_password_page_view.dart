part of 'forgot_password_page.dart';

class _ForgotPasswordPageView extends StatefulWidget {
  const _ForgotPasswordPageView();

  @override
  State<_ForgotPasswordPageView> createState() =>
      _ForgotPasswordPageViewState();
}

class _ForgotPasswordPageViewState extends State<_ForgotPasswordPageView>
    with _ForgotPasswordPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppLangDropdown.circle(
            onChanged: (_) => setState(() {}),
          ),
          context.ext.sizedBox.width.lg,
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
                      AppVectors.forgotPass,
                    ),
                  ),
                  context.ext.sizedBox.height.xl2,
                  Text(
                    LocaleKeys.pagesForgotPasswordTitle.translate,
                    textAlign: TextAlign.center,
                    style: context.ext.theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  context.ext.sizedBox.height.xs,
                  Text(
                    LocaleKeys.pagesForgotPasswordDescription.translate,
                    textAlign: TextAlign.center,
                    style: context.ext.theme.textTheme.bodyLarge,
                  ),
                  context.ext.sizedBox.height.xl6,
                  AppElevatedButton(
                    onPressed: _sendEmail,
                    child: Text(
                      LocaleKeys.pagesForgotPasswordSendButtonLabel.translate,
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
