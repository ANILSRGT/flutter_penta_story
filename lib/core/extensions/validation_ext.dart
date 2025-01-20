import 'package:flutter/services.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';

extension ValidationExt on String? {
  String? get validateEmail {
    if (ext.validation.isNullOrEmpty) {
      return LocaleKeys.validationsRequiredEmail.translate;
    }
    if (!ext.validation.validEmail) {
      return LocaleKeys.validationsInvalidEmail.translate;
    }
    return null;
  }

  String? get validatePassword {
    if (ext.validation.isNullOrEmpty) {
      return LocaleKeys.validationsRequiredPassword.translate;
    }
    if ((this?.length ?? -1) < 8) {
      return LocaleKeys.validationsLengthPasswordArgs1.translateWith(['8']);
    }
    return null;
  }

  static List<FilteringTextInputFormatter> get usernameFormatters {
    return [
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9._]')),
      FilteringTextInputFormatter.deny(RegExp(r'\s')),
    ];
  }

  String? get validateUsername {
    if (ext.validation.isNullOrEmpty) {
      return LocaleKeys.validationsRequiredUsername.translate;
    }
    return null;
  }

  String? get validateFirstName {
    if (ext.validation.isNullOrEmpty) {
      return LocaleKeys.validationsRequiredFirstName.translate;
    }
    return null;
  }

  String? get validateLastName {
    if (ext.validation.isNullOrEmpty) {
      return LocaleKeys.validationsRequiredLastName.translate;
    }
    return null;
  }
}
