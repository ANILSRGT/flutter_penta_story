import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';

class ModelWithLang<T> {
  const ModelWithLang({
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

  final Map<AppLocaliaztionsEnum, T> data;

  Map<String, T> toJson() {
    return data.map(
      (key, value) => MapEntry(
        key.localeString,
        value,
      ),
    );
  }
}
