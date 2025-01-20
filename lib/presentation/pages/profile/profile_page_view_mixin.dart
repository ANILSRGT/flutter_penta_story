part of 'profile_page.dart';

mixin _ProfilePageViewMixin on State<_ProfilePageView> {
  final _viewModel = ProfilePageViewModel();

  Future<void> _pickProfileImage() async {
    final image = await ProfieImagePicker.pickProfileImage(context: context);
    if (image != null) _viewModel.profileImage = image;
  }
}
