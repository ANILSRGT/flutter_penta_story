import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/presentation/pages/story/story_read_book/story_book_page.dart';
import 'package:penta_story/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/story/story_book_image.dart';
import 'package:penta_story/presentation/widgets/tile/app_expansion_tile.dart';

part 'story_details_page_view.dart';
part 'story_details_page_view_mixin.dart';

@RoutePage()
class StoryDetailsPage extends StatelessWidget {
  const StoryDetailsPage({
    required this.args,
    super.key,
  });

  final StoryDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    return _StoryDetailsPageView(args: args);
  }
}

class StoryDetailsPageArgs {
  const StoryDetailsPageArgs({required this.story});

  final StoryModel story;
}
