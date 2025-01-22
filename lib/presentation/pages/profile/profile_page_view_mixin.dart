part of 'profile_page.dart';

mixin _ProfilePageViewMixin on State<_ProfilePageView> {
  Future<void> _pickProfileImage() async {
    await context.showLoadingDialog<ResponseModel<String>>(
      future: () async {
        final image =
            await ProfieImagePicker.pickProfileImage(context: context);
        if (image == null || !mounted) {
          return const ResponseModelSuccessNegative(message: '', data: null);
        }
        final res = await Injection.I
            .read<UsersChangeProfileImageUsecase>()
            .execute(UsersChangeProfileImageParams(image: image));
        return res.when(
          onSuccess: (_) => ResponseModelSuccess(data: image),
          onSuccessNegative: (data, message) =>
              const ResponseModelSuccessNegative(
            data: null,
            message: '',
          ),
          onFail: (_) => res.asFail.castTo<String>(),
        );
      },
      callback: (result) {
        result.whenOrNull(
          onSuccess: (data) async {
            if (!mounted) return;
            await context.read<UserNotifier>().reloadUser();
          },
          onFail: (fail) => showToast(fail.error.message),
        );
      },
    );
  }
}
