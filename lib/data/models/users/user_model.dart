import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String bio,
  }) = _UserModel;

  factory UserModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) {
    return UserModel(
      id: id,
      firstName: json[firstNameKey] as String,
      lastName: json[lastNameKey] as String,
      bio: json[bioKey] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      firstNameKey: firstName,
      lastNameKey: lastName,
      bioKey: bio,
    };
  }

  static const firstNameKey = 'firstName';
  static const lastNameKey = 'lastName';
  static const bioKey = 'bio';
}
