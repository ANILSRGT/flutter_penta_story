import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/utils/image_string_converter.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';

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
  const StoryBookPageArgs({required this.story});

  final StoryModel story;
}
