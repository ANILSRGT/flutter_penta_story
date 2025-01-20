// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_profile_generator_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthProfileGeneratorPageViewModel
    on _AuthProfileGeneratorPageViewModelBase, Store {
  late final _$profileImageAtom = Atom(
      name: '_AuthProfileGeneratorPageViewModelBase.profileImage',
      context: context);

  @override
  String? get profileImage {
    _$profileImageAtom.reportRead();
    return super.profileImage;
  }

  @override
  set profileImage(String? value) {
    _$profileImageAtom.reportWrite(value, super.profileImage, () {
      super.profileImage = value;
    });
  }

  @override
  String toString() {
    return '''
profileImage: ${profileImage}
    ''';
  }
}
