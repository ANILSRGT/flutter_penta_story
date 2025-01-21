part of 'authentication_page.dart';

class _AuthenticationPageView extends StatefulWidget {
  const _AuthenticationPageView();

  @override
  State<_AuthenticationPageView> createState() =>
      _AuthenticationPageViewState();
}

class _AuthenticationPageViewState extends State<_AuthenticationPageView>
    with _AuthenticationPageViewMixin {
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
          child: context.ext.screen.byOrientation(
            portrait: SingleChildScrollView(
              child: Padding(
                padding: context.ext.padding.horizontal.xl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    context.ext.sizedBox.height.xl,
                    _buildImage(context),
                    context.ext.sizedBox.height.xl6,
                    context.ext.sizedBox.height.xl3,
                    _buildForm(context),
                    context.ext.sizedBox.height.xl,
                  ],
                ),
              ),
            ),
            landscape: Padding(
              padding: context.ext.padding.horizontal.xl,
              child: Row(
                children: [
                  Flexible(child: _buildImage(context)),
                  context.ext.sizedBox.width.xl,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          context.ext.sizedBox.height.xl,
                          _buildForm(context),
                          context.ext.sizedBox.height.xl,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildImage(BuildContext context) {
    return SizedBox(
      height: context.ext.screen.byOrientation(
        portrait: context.ext.screen.width * 0.35,
        landscape: context.ext.screen.height * 0.3,
      ),
      child: SvgPicture.asset(
        AppVectors.login,
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailField(context),
          context.ext.sizedBox.height.lg,
          _buildPasswordField(context),
          Observer(
            builder: (_) => Column(
              children: [
                context.ext.sizedBox.height.md,
                _buildForgotPassword(context),
              ],
            ).ext.widget.visible(_viewModel.isLoginState),
          ),
          context.ext.sizedBox.height.xl3,
          SizedBox(
            width: double.infinity,
            child: _buildAuthButton(context),
          ),
          context.ext.sizedBox.height.xl6,
          _buildHaveAccount(context),
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return AppTextFormField(
      controller: _emailController,
      hintText: LocaleKeys.pagesAuthenticationFieldsEmailHint.translate,
      prefixIcon: AppIcons.email,
      focusNode: _emailFocusNode,
      nextFocusNode: _passwordFocusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (p0) => p0.validateEmail,
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return AppTextFormField(
      controller: _passwordController,
      hintText: LocaleKeys.pagesAuthenticationFieldsPasswordHint.translate,
      prefixIcon: AppIcons.lock,
      focusNode: _passwordFocusNode,
      nextFocusNode: _buttonFocusNode,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      validator: (p0) => p0.validatePassword,
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: _forgotPassword,
        child: Text(
          LocaleKeys.pagesAuthenticationButtonsForgotPasswordLabel.translate,
          textAlign: TextAlign.right,
          style: context.ext.theme.textTheme.bodyLarge?.copyWith(
            color: context.appThemeExt.appColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton(BuildContext context) {
    return AppElevatedButton(
      onPressed: _authButton,
      focusNode: _buttonFocusNode,
      child: Observer(
        builder: (_) {
          return Text(
            _viewModel.isLoginState
                ? LocaleKeys.pagesAuthenticationButtonsSignInLabel.translate
                : LocaleKeys.pagesAuthenticationButtonsSignUpLabel.translate,
          );
        },
      ),
    );
  }

  Widget _buildHaveAccount(BuildContext context) {
    return GestureDetector(
      onTap: _viewModel.toggleAuthState,
      child: Observer(
        builder: (_) {
          return Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${_viewModel.isLoginState ? LocaleKeys.pagesAuthenticationButtonsHasAccountNotLabel.translate : LocaleKeys.pagesAuthenticationButtonsHasAccountHasLabel.translate}\t',
                ),
                TextSpan(
                  text: _viewModel.isLoginState
                      ? LocaleKeys
                          .pagesAuthenticationButtonsHasAccountNotSublabel
                          .translate
                      : LocaleKeys
                          .pagesAuthenticationButtonsHasAccountHasSublabel
                          .translate,
                  style: const TextStyle().copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.appThemeExt.appColors.primary,
                  ),
                ),
              ],
            ),
            style: context.ext.theme.textTheme.bodyLarge,
          );
        },
      ),
    );
  }
}
