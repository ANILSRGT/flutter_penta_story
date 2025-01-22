import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String bio,
    @Default(null) String? image,
  }) = _UserModel;

  UserModel._();

  factory UserModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) =>
      UserModel(
        id: id,
        username: json[usernameKey] as String,
        email: json[emailKey] as String,
        firstName: json[firstNameKey] as String,
        lastName: json[lastNameKey] as String,
        image: json[imageKey] as String?,
        bio: json[bioKey] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      usernameKey: username,
      emailKey: email,
      firstNameKey: firstName,
      lastNameKey: lastName,
      imageKey: image,
      bioKey: bio,
    };
  }

  String get fullName => '$firstName $lastName';

  static const usernameKey = 'username';
  static const emailKey = 'email';
  static const firstNameKey = 'firstName';
  static const lastNameKey = 'lastName';
  static const imageKey = 'image';
  static const bioKey = 'bio';
}
