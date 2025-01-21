part of 'forgot_password_page.dart';

mixin _ForgotPasswordPageViewMixin on State<_ForgotPasswordPageView> {
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _sendEmailButtonFocusNode = FocusNode();

  Future<void> _sendEmail() async {
    if (!_emailController.selection.isValid) {
      showToast('Invalid email');
      return;
    }

    showToast('Email sent');
    context.router.back();
    return context.showLoadingDialog(
      future: () async =>
          Injection.I.read<AuthSendPasswordResetEmailUsecase>().execute(
                AuthSendPasswordResetEmailParams(email: _emailController.text),
              ),
      callback: (res) async {
        return await res.when(
          onSuccess: (value) async {
            showToast('Email sent');
            if (!mounted) return;
            context.router.back();
          },
          onSuccessNegative: (_, message) async => showToast(message),
          onFail: (fail) async => showToast(fail.error.message),
        );
      },
    );
  }
}
