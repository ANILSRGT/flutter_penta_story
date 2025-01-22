import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/firestore_paths.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/data/models/users/params/users_create_params.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';

abstract class UsersRemoteSource {
  Future<ResponseModel<UserModel>> createUser(UsersCreateParams params);
  Future<ResponseModel<List<UserModel>>> getUsers();
  Future<ResponseModel<UserModel>> getUserById(UsersGetUserByIdParams params);
}

final class UsersRemoteSourceImpl implements UsersRemoteSource {
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ResponseModel<UserModel>> createUser(UsersCreateParams params) async {
    try {
      final emailCheckSnap = await _firebaseFirestore
          .collection(FirestorePaths.users)
          .where(UserModel.emailKey, isEqualTo: params.user.email)
          .limit(1)
          .get();

      if (emailCheckSnap.docs.isNotEmpty) {
        return ResponseModelSuccessNegative(
          data: null,
          message:
              LocaleKeys.dataSourcesUsersCreateUserErrorsEmailExists.translate,
        );
      }

      final usernameCheckSnap = await _firebaseFirestore
          .collection(FirestorePaths.users)
          .where(UserModel.usernameKey, isEqualTo: params.user.username)
          .limit(1)
          .get();

      if (usernameCheckSnap.docs.isNotEmpty) {
        return ResponseModelSuccessNegative(
          data: null,
          message: LocaleKeys
              .dataSourcesUsersCreateUserErrorsUsernameExists.translate,
        );
      }

      await _firebaseFirestore
          .collection(FirestorePaths.users)
          .doc(params.user.id)
          .set(params.user.toJson());

      return ResponseModelSuccess(data: params.user);
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message:
              LocaleKeys.dataSourcesUsersCreateUserErrorsAnotherError.translate,
          throwMessage: 'Users/CreateUser/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<UserModel>> getUserById(
    UsersGetUserByIdParams params,
  ) async {
    try {
      final userDoc = await _firebaseFirestore
          .collection(FirestorePaths.users)
          .doc(params.id)
          .get();
      final data = userDoc.data();
      if (data == null) {
        return ResponseModelSuccessNegative(
          data: null,
          message: LocaleKeys
              .dataSourcesUsersGetUserByIdErrorsUserNotFound.translate,
        );
      }

      return ResponseModelSuccess(
        data: UserModel.fromJson(
          id: userDoc.id,
          json: data,
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: LocaleKeys
              .dataSourcesUsersGetUserByIdErrorsAnotherError.translate,
          throwMessage: 'Users/GetUserById/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<List<UserModel>>> getUsers() async {
    try {
      final usersSnapshot =
          await _firebaseFirestore.collection(FirestorePaths.users).get();
      final users = usersSnapshot.docs
          .map((doc) => UserModel.fromJson(id: doc.id, json: doc.data()))
          .toList();

      return ResponseModelSuccess(data: users);
    } on Exception catch (e) {
      return Future.value(
        ResponseModelFail(
          error: ErrorModel(
            message:
                LocaleKeys.dataSourcesUsersGetUsersErrorsAnotherError.translate,
            throwMessage: 'Users/GetUsers/Catch: $e',
          ),
        ),
      );
    }
  }
}
