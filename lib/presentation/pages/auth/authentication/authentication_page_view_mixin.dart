part of 'authentication_page.dart';

mixin _AuthenticationPageViewMixin on State<_AuthenticationPageView> {
  final _viewModel = AuthenticationPageViewModel();

  final _formKey = GlobalKey<FormState>();
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

  Future<void> _authButton() async {
    final isLogin = _viewModel.isLoginState;
    var success = false;

    final isValidate = _formKey.currentState?.validate() ?? false;
    if (!isValidate) {
      showToast('Please fill in all fields correctly');
      return;
    }

    if (isLogin) {
      success = await _login();
    } else {
      success = await _register();
    }

    if (!success && !mounted) return;
    unawaited(context.router.replaceAll([const EmailVerificationRoute()]));
  }

  Future<bool> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final result =
        await Injection.I.read<AuthSingInWithEmailAndPasswordUsecase>().execute(
              AuthSignInWithEmailAndPasswordParams(
                email: email,
                password: password,
              ),
            );

    if (result.isFail) {
      showToast(result.asFail.error.message);
      return false;
    }

    return true;
  }

  Future<bool> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final result =
        await Injection.I.read<AuthSingUpWithEmailAndPasswordUsecase>().execute(
              AuthSignUpWithEmailAndPasswordParams(
                email: email,
                password: password,
              ),
            );

    if (result.isFail) {
      showToast(result.asFail.error.message);
      return false;
    }

    return true;
  }
}
