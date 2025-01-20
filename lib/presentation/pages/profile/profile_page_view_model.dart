import 'package:mobx/mobx.dart';

part 'profile_page_view_model.g.dart';

class ProfilePageViewModel = _ProfilePageViewModelBase
    with _$ProfilePageViewModel;

abstract class _ProfilePageViewModelBase with Store {
  @observable
  String? profileImage;
}
