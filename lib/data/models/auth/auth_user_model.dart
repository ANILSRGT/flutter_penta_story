import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    required String uid,
    required String email,
    required bool emailVerified,
  }) = _AuthUserModel;
}
