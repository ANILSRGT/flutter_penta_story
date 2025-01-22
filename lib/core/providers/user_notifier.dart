import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';
import 'package:penta_story/domain/usecases/users/users_get_user_by_id_usecase.dart';
import 'package:penta_story/injection.dart';

class UserNotifier extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<void> reloadUser() async {
    await Injection.I
        .read<FirebaseAuth>()
        .currentUser!
        .reload()
        .catchError((_) {});
    final authUser = Injection.I.read<FirebaseAuth>().currentUser;
    if (authUser == null) {
      _user = null;
      notifyListeners();
      return;
    }
    final userRes = await Injection.I
        .read<UsersGetUserByIdUsecase>()
        .execute(UsersGetUserByIdParams(id: authUser.uid));
    userRes.when(
      onSuccess: setUser,
      onSuccessNegative: (_, message) => showToast(message),
      onFail: (fail) => showToast(fail.error.message),
    );
  }
}
