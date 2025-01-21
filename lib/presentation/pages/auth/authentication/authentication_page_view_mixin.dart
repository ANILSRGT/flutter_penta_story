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

    final isValidate = _formKey.currentState?.validate() ?? false;
    if (!isValidate) {
      showToast('Please fill in all fields correctly');
      return;
    }

    if (isLogin) {
      return _login();
    } else {
      return _register();
    }
  }

  Future<void> _checkUserAndNavigate(String userId) async {
    final result = await Injection.I
        .read<UsersGetUserByIdUsecase>()
        .execute(UsersGetUserByIdParams(id: userId));

    return result.when(
      onSuccess: (data) async {
        if (!mounted) return;
        context.read<UserNotifier>().setUser(data);
        await context.router.replaceAll([const HomeRoute()]);
      },
      onSuccessNegative: (data, message) async {
        if (!mounted) return;
        await context.router.replaceAll([const AuthProfileGeneratorRoute()]);
      },
      onFail: (fail) => showToast(fail.error.message),
    );
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await context.showLoadingDialog(
      future: () async {
        return Injection.I
            .read<AuthSingInWithEmailAndPasswordUsecase>()
            .execute(
              AuthSignInWithEmailAndPasswordParams(
                email: email,
                password: password,
              ),
            );
      },
      callback: (result) {
        result.when(
          onSuccess: (data) async => _checkUserAndNavigate(data.uid),
          onSuccessNegative: (data, message) => showToast(message),
          onFail: (fail) => showToast(fail.error.message),
        );
      },
    );
  }

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    await context.showLoadingDialog(
      future: () async {
        return Injection.I
            .read<AuthSingUpWithEmailAndPasswordUsecase>()
            .execute(
              AuthSignUpWithEmailAndPasswordParams(
                email: email,
                password: password,
              ),
            );
      },
      callback: (result) {
        result.when(
          onSuccess: (data) async {
            if (!mounted) return;
            return context.router.replaceAll([const EmailVerificationRoute()]);
          },
          onSuccessNegative: (data, message) => showToast(message),
          onFail: (fail) => showToast(fail.error.message),
        );
      },
    );
  }
}
