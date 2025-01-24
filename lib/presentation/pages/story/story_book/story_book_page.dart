import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/core/utils/app_loading_dialog.dart';
import 'package:penta_story/core/utils/image_string_converter.dart';
import 'package:penta_story/data/models/stories/story_chapter_model.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/data/models/stories/story_page_model.dart';
import 'package:penta_story/data/models/stories/story_page_part_model.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:penta_story/presentation/widgets/tile/app_expansion_tile.dart';

part 'story_book_page_view.dart';
part 'story_book_page_view_mixin.dart';

@RoutePage()
class StoryBookPage extends StatelessWidget {
  const StoryBookPage({
    required this.args,
    super.key,
  });

  final StoryBookPageArgs args;

  @override
  Widget build(BuildContext context) {
    return _StoryBookPageView(args: args);
  }
}

class StoryBookPageArgs {
  const StoryBookPageArgs({
    required this.story,
    required this.bookType,
  });

  final StoryModel story;
  final StoryBookTypes bookType;
}

enum StoryBookTypes { read, listen }
