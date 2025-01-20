import 'package:mobx/mobx.dart';

part 'auth_profile_generator_page_view_model.g.dart';

class AuthProfileGeneratorPageViewModel = _AuthProfileGeneratorPageViewModelBase
    with _$AuthProfileGeneratorPageViewModel;

abstract class _AuthProfileGeneratorPageViewModelBase with Store {
  @observable
  String? profileImage;
}
