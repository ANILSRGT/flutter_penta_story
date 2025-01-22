import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';

class ModelWithLang<T> {
  const ModelWithLang({
    required Map<AppLocaliaztionsEnum, T> data,
  }) : _data = data;

  factory ModelWithLang.fromJson(Map<String, dynamic> json) {
    return ModelWithLang(
      data: json.map(
        (key, value) => MapEntry(
          AppLocaliaztionsEnum.fromLocaleString(key),
          value as T,
        ),
      ),
    );
  }

  final Map<AppLocaliaztionsEnum, T> _data;

  Map<String, T> toJson() {
    return _data.map(
      (key, value) => MapEntry(
        key.localeString,
        value,
      ),
    );
  }

  T? data(BuildContext context) {
    return _data[AppLocaliaztionsEnum.fromLocale(context.locale)];
  }

  T? dataFromAppLocaliaztionsEnum(AppLocaliaztionsEnum appLocaliaztionsEnum) {
    return _data[appLocaliaztionsEnum];
  }
}
