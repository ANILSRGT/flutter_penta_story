import 'package:mobx/mobx.dart';

part 'authentication_page_view_model.g.dart';

class AuthenticationPageViewModel = _AuthenticationPageViewModelBase
    with _$AuthenticationPageViewModel;

abstract class _AuthenticationPageViewModelBase with Store {
  @observable
  bool _isLoginState = true;

  @computed
  bool get isLoginState => _isLoginState;

  @action
  void toggleAuthState() {
    _isLoginState = !_isLoginState;
  }
}
