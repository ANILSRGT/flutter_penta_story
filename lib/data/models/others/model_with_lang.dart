import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';

class ModelWithLang<T> {
  ModelWithLang({
    required this.data,
  });

  factory ModelWithLang.fromJson(Map<String, T> json) {
    return ModelWithLang(
      data: json.map(
        (key, value) => MapEntry(
          AppLocaliaztionsEnum.fromLocaleString(key),
          value,
        ),
      ),
    );
  }

  Map<AppLocaliaztionsEnum, T> data;
}
