import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';
import 'package:penta_story/domain/repositories/users/users_repository.dart';
import 'package:penta_story/injection.dart';

final class UsersGetUserByIdUsecase
    implements IUseCaseWithParams<UserModel, UsersGetUserByIdParams> {
  @override
  Future<ResponseModel<UserModel>> execute(
    UsersGetUserByIdParams params,
  ) async {
    return Injection.I.read<UsersRepository>().getUserById(params);
  }
}
