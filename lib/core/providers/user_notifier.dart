import 'package:flutter/material.dart';
import 'package:penta_story/data/models/users/user_model.dart';

class UserNotifier extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
