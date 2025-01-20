// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationPageViewModel on _AuthenticationPageViewModelBase, Store {
  Computed<bool>? _$isLoginStateComputed;

  @override
  bool get isLoginState =>
      (_$isLoginStateComputed ??= Computed<bool>(() => super.isLoginState,
              name: '_AuthenticationPageViewModelBase.isLoginState'))
          .value;

  late final _$_isLoginStateAtom = Atom(
      name: '_AuthenticationPageViewModelBase._isLoginState', context: context);

  @override
  bool get _isLoginState {
    _$_isLoginStateAtom.reportRead();
    return super._isLoginState;
  }

  @override
  set _isLoginState(bool value) {
    _$_isLoginStateAtom.reportWrite(value, super._isLoginState, () {
      super._isLoginState = value;
    });
  }

  late final _$_AuthenticationPageViewModelBaseActionController =
      ActionController(
          name: '_AuthenticationPageViewModelBase', context: context);

  @override
  void toggleAuthState() {
    final _$actionInfo = _$_AuthenticationPageViewModelBaseActionController
        .startAction(name: '_AuthenticationPageViewModelBase.toggleAuthState');
    try {
      return super.toggleAuthState();
    } finally {
      _$_AuthenticationPageViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoginState: ${isLoginState}
    ''';
  }
}
