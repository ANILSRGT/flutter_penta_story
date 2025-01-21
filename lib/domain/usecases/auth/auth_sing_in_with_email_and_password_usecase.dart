import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/auth/auth_user_model.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_in_with_email_and_password_params.dart';
import 'package:penta_story/domain/repositories/auth/auth_repository.dart';
import 'package:penta_story/injection.dart';

final class AuthSingInWithEmailAndPasswordUsecase
    implements
        IUseCaseWithParams<AuthUserModel,
            AuthSignInWithEmailAndPasswordParams> {
  @override
  Future<ResponseModel<AuthUserModel>> execute(
    AuthSignInWithEmailAndPasswordParams params,
  ) async {
    return Injection.I
        .read<AuthRepository>()
        .signInWithEmailAndPassword(params);
  }
}
