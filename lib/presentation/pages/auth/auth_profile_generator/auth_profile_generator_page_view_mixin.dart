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
    final pickedImage = await ImagePickerUtil.pickAndCropImage(
      context: context,
      ratioX: 1,
      ratioY: 1,
    );

    final imageBytes = await pickedImage?.readAsBytes();
    final image = imageBytes?.ext.convert.toBase64;

    if (image != null) {
      _viewModel.profileImage = image;
    }
  }

  void _onContinue() {
    // TODO: save profile

    context.router.replaceAll([const HomeRoute()]);
  }
}
