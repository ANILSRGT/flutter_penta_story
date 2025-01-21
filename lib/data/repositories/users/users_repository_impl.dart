import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/users/params/users_create_params.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';
import 'package:penta_story/data/sources/users/users_remote_source.dart';
import 'package:penta_story/domain/repositories/users/users_repository.dart';
import 'package:penta_story/injection.dart';

final class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<ResponseModel<UserModel>> createUser(UsersCreateParams params) async {
    return Injection.I.read<UsersRemoteSource>().createUser(params);
  }

  @override
  Future<ResponseModel<UserModel>> getUserById(
    UsersGetUserByIdParams params,
  ) async {
    return Injection.I.read<UsersRemoteSource>().getUserById(params);
  }

  @override
  Future<ResponseModel<List<UserModel>>> getUsers() async {
    return Injection.I.read<UsersRemoteSource>().getUsers();
  }
}
