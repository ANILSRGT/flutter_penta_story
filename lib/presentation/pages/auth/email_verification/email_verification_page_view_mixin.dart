part of 'email_verification_page.dart';

mixin _EmailVerificationPageViewMixin on State<_EmailVerificationPageView> {
  Timer? _emailCheckTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _emailCheck();
    });
  }

  Future<void> _emailCheck() async {
    _emailCheckTimer?.cancel();
    await context.showLoadingDialog(
      future: () async {
        return Injection.I.read<AuthSendEmailVerificationUsecase>().execute();
      },
      callback: (value) {
        if (value.isFail) {
          showToast(value.asFail.error.message);
          return;
        }

        _emailCheckTimer = Timer.periodic(
          const Duration(seconds: 5),
          (timer) async {
            await FirebaseAuth.instance.currentUser
                ?.reload()
                .catchError((_) {});
            if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
              timer.cancel();
              if (!mounted) return;
              await context.router
                  .replaceAll([const AuthProfileGeneratorRoute()]);
            }
          },
        );
      },
    );
  }
}
