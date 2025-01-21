import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/auth/auth_user_model.dart';
import 'package:penta_story/data/models/auth/params/auth_send_password_reset_email_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_in_with_email_and_password_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_up_with_email_and_password_params.dart';
import 'package:penta_story/data/sources/auth/auth_remote_source.dart';
import 'package:penta_story/domain/repositories/auth/auth_repository.dart';
import 'package:penta_story/injection.dart';

final class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<ResponseModel<void>> sendEmailVerification() async {
    return Injection.I.read<AuthRemoteSource>().sendEmailVerification();
  }

  @override
  Future<ResponseModel<void>> sendPasswordResetEmail(
    AuthSendPasswordResetEmailParams params,
  ) async {
    return Injection.I.read<AuthRemoteSource>().sendPasswordResetEmail(params);
  }

  @override
  Future<ResponseModel<AuthUserModel>> signInWithEmailAndPassword(
    AuthSignInWithEmailAndPasswordParams params,
  ) async {
    return Injection.I
        .read<AuthRemoteSource>()
        .signInWithEmailAndPassword(params);
  }

  @override
  Future<ResponseModel<void>> signOut() async {
    return Injection.I.read<AuthRemoteSource>().signOut();
  }

  @override
  Future<ResponseModel<AuthUserModel>> signUpWithEmailAndPassword(
    AuthSignUpWithEmailAndPasswordParams params,
  ) async {
    return Injection.I
        .read<AuthRemoteSource>()
        .signUpWithEmailAndPassword(params);
  }
}
