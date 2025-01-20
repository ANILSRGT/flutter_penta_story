part of 'authentication_page.dart';

mixin _AuthenticationPageViewMixin on State<_AuthenticationPageView> {
  final _viewModel = AuthenticationPageViewModel();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _buttonFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _buttonFocusNode.dispose();
    super.dispose();
  }

  void _forgotPassword() {
    context.router.push(const ForgotPasswordRoute());
  }

  void _authButton() {
    // TODO: Auth

    context.router.replaceAll([const EmailVerificationRoute()]);
  }
}
