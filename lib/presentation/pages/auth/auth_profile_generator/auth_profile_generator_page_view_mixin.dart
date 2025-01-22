part of 'auth_profile_generator_page.dart';

mixin _AuthProfileGeneratorPageViewMixin
    on State<_AuthProfileGeneratorPageView> {
  final _viewModel = AuthProfileGeneratorPageViewModel();

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _bioFocusNode = FocusNode();
  final _continueBtnFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _bioController.dispose();
    _usernameFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _bioFocusNode.dispose();
    _continueBtnFocusNode.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    final image = await ProfieImagePicker.pickProfileImage(context: context);
    if (image != null) _viewModel.profileImage = image;
  }

  Future<void> _onContinue() async {
    if (_formKey.currentState?.validate() == false) {
      showToast(
        LocaleKeys.pagesAuthProfileGeneratorMixinOnContinueFormValidateError
            .translate,
      );
      return;
    }

    final username = _usernameController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final bio = _bioController.text;

    await context.showLoadingDialog(
      future: () async {
        final authUser = FirebaseAuth.instance.currentUser;
        if (authUser == null || authUser.email == null) return null;
        return Injection.I.read<UsersCreateUsecase>().execute(
              UsersCreateParams(
                user: UserModel(
                  id: authUser.uid,
                  username: username,
                  email: authUser.email!,
                  firstName: firstName,
                  lastName: lastName,
                  bio: bio,
                  image: _viewModel.profileImage,
                ),
              ),
            );
      },
      callback: (result) async {
        if (result == null) {
          showToast(
            LocaleKeys
                .pagesAuthProfileGeneratorMixinOnContinueUserNotFound.translate,
          );
          return;
        }

        await result.when<Future<void>>(
          onSuccess: (user) async {
            context.read<UserNotifier>().setUser(user);
            return context.router.replaceAll([const HomeRoute()]);
          },
          onSuccessNegative: (_, message) async => showToast(message),
          onFail: (fail) async => showToast(fail.error.message),
        );
      },
    );
  }
}
