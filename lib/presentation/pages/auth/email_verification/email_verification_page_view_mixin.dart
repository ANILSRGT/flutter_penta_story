part of 'email_verification_page.dart';

mixin _EmailVerificationPageViewMixin on State<_EmailVerificationPageView> {
  void _emailCheck() {
    // TODO: Email check control

    context.router.replaceAll([const AuthProfileGeneratorRoute()]);
  }
}
