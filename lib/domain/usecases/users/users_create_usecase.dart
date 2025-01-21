import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/users/params/users_create_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';
import 'package:penta_story/domain/repositories/users/users_repository.dart';
import 'package:penta_story/injection.dart';

final class UsersCreateUsecase
    implements IUseCaseWithParams<UserModel, UsersCreateParams> {
  @override
  Future<ResponseModel<UserModel>> execute(
    UsersCreateParams params,
  ) async {
    return Injection.I.read<UsersRepository>().createUser(params);
  }
}
