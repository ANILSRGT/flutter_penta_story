import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/auth/params/auth_send_password_reset_email_params.dart';
import 'package:penta_story/domain/repositories/auth/auth_repository.dart';
import 'package:penta_story/injection.dart';

final class AuthSendPasswordResetEmailUsecase
    implements IUseCaseWithParams<void, AuthSendPasswordResetEmailParams> {
  @override
  Future<ResponseModel<void>> execute(
    AuthSendPasswordResetEmailParams params,
  ) async {
    return Injection.I.read<AuthRepository>().sendPasswordResetEmail(params);
  }
}
