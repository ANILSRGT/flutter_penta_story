import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/data/models/auth/auth_user_model.dart';
import 'package:penta_story/data/models/auth/params/auth_send_password_reset_email_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_in_with_email_and_password_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_up_with_email_and_password_params.dart';
import 'package:penta_story/injection.dart';

abstract class AuthRemoteSource {
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

final class AuthRemoteSourceImpl extends AuthRemoteSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ResponseModel<void>> sendEmailVerification() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const ResponseModelFail(
          error: ErrorModel(
            message: 'User not found',
            throwMessage: 'Auth/SendEmailVerification: User not found',
          ),
        );
      }
      await user.sendEmailVerification();
      return const ResponseModelSuccess(data: null);
    } on FirebaseAuthException catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: FirebaseExceptionConverter.getMessage(
            e.code,
            locale: Injection.I.globalKey.currentContext?.locale,
          ),
          throwMessage: 'Auth/SendEmailVerification/FirebaseCatch: $e',
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'An error occurred while sending email verification',
          throwMessage: 'Auth/SendEmailVerification/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<void>> sendPasswordResetEmail(
    AuthSendPasswordResetEmailParams params,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: params.email);
      return const ResponseModelSuccess(data: null);
    } on FirebaseAuthException catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: FirebaseExceptionConverter.getMessage(
            e.code,
            locale: Injection.I.globalKey.currentContext?.locale,
          ),
          throwMessage: 'Auth/SendPasswordResetEmail/FirebaseCatch: $e',
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'An error occurred while sending password reset email',
          throwMessage: 'Auth/SendPasswordResetEmail/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<AuthUserModel>> signInWithEmailAndPassword(
    AuthSignInWithEmailAndPasswordParams params,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final user = userCredential.user;
      if (user == null) {
        return const ResponseModelFail(
          error: ErrorModel(
            message: 'An error occurred while signing in',
            throwMessage: 'Auth/SignInWithEmailAndPassword: User not found',
          ),
        );
      }
      return ResponseModelSuccess(
        data: AuthUserModel(
          uid: user.uid,
          email: user.email ?? '',
          emailVerified: user.emailVerified,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: FirebaseExceptionConverter.getMessage(
            e.code,
            locale: Injection.I.globalKey.currentContext?.locale,
          ),
          throwMessage: 'Auth/SignInWithEmailAndPassword/FirebaseCatch: $e',
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'An error occurred while signing in',
          throwMessage: 'Auth/SignInWithEmailAndPassword/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const ResponseModelSuccess(data: null);
    } on FirebaseAuthException catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: FirebaseExceptionConverter.getMessage(
            e.code,
            locale: Injection.I.globalKey.currentContext?.locale,
          ),
          throwMessage: 'Auth/SignOut/FirebaseCatch: $e',
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'An error occurred while signing out',
          throwMessage: 'Auth/SignOut/Catch: $e',
        ),
      );
    }
  }

  @override
  Future<ResponseModel<AuthUserModel>> signUpWithEmailAndPassword(
    AuthSignUpWithEmailAndPasswordParams params,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final user = userCredential.user;
      if (user == null) {
        return const ResponseModelFail(
          error: ErrorModel(
            message: 'An error occurred while signing up',
            throwMessage: 'Auth/SignUpWithEmailAndPassword: User not found',
          ),
        );
      }
      return ResponseModelSuccess(
        data: AuthUserModel(
          uid: user.uid,
          email: user.email ?? '',
          emailVerified: user.emailVerified,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: FirebaseExceptionConverter.getMessage(
            e.code,
            locale: Injection.I.globalKey.currentContext?.locale,
          ),
          throwMessage: 'Auth/SignUpWithEmailAndPassword/FirebaseCatch: $e',
        ),
      );
    } on Exception catch (e) {
      return ResponseModelFail(
        error: ErrorModel(
          message: 'An error occurred while signing up',
          throwMessage: 'Auth/SignUpWithEmailAndPassword/Catch: $e',
        ),
      );
    }
  }
}
