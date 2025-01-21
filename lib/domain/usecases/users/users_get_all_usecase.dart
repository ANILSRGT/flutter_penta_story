import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/users/user_model.dart';
import 'package:penta_story/domain/repositories/users/users_repository.dart';
import 'package:penta_story/injection.dart';

final class UsersGetAllUsecase implements IUseCase<List<UserModel>> {
  @override
  Future<ResponseModel<List<UserModel>>> execute() async {
    return Injection.I.read<UsersRepository>().getUsers();
  }
}
