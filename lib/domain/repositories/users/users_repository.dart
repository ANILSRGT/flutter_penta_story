import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/users/params/users_change_profile_image_params.dart';
import 'package:penta_story/data/models/users/params/users_create_params.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';

abstract class UsersRepository {
  Future<ResponseModel<UserModel>> createUser(UsersCreateParams params);
  Future<ResponseModel<List<UserModel>>> getUsers();
  Future<ResponseModel<UserModel>> getUserById(UsersGetUserByIdParams params);
  Future<ResponseModel<void>> changeProfileImage(
    UsersChangeProfileImageParams params,
  );
}
