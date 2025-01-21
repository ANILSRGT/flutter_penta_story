import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/auth/auth_user_model.dart';
import 'package:penta_story/data/models/auth/params/auth_send_password_reset_email_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_in_with_email_and_password_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_up_with_email_and_password_params.dart';

abstract class AuthRepository {
  Future<ResponseModel<AuthUserModel>> signInWithEmailAndPassword(
    AuthSignInWithEmailAndPasswordParams params,
  );
  Future<ResponseModel<AuthUserModel>> signUpWithEmailAndPassword(
    AuthSignUpWithEmailAndPasswordParams params,
  );
  Future<ResponseModel<void>> sendEmailVerification();
  Future<ResponseModel<void>> sendPasswordResetEmail(
    AuthSendPasswordResetEmailParams params,
  );
  Future<ResponseModel<void>> signOut();
}
