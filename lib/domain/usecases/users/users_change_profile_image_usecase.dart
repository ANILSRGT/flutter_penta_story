import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/users/params/users_change_profile_image_params.dart';
import 'package:penta_story/domain/repositories/users/users_repository.dart';
import 'package:penta_story/injection.dart';

final class UsersChangeProfileImageUsecase
    implements IUseCaseWithParams<void, UsersChangeProfileImageParams> {
  @override
  Future<ResponseModel<void>> execute(
    UsersChangeProfileImageParams params,
  ) async {
    return Injection.I.read<UsersRepository>().changeProfileImage(params);
  }
}
