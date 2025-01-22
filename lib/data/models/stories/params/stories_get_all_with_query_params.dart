import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';

class StoriesGetAllWithQueryParams {
  StoriesGetAllWithQueryParams({
    required this.lang,
    this.title,
    this.author,
  });

  final AppLocaliaztionsEnum lang;
  final String? title;
  final String? author;
}
