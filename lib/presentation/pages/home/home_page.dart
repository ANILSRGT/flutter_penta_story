import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/presentation/widgets/avatar/profile_avatar_widget.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/searchbar/app_searchbar.dart';
import 'package:penta_story/presentation/widgets/story/story_book_image.dart';
import 'package:penta_story/presentation/widgets/story/story_grid_card.dart';
import 'package:penta_story/presentation/widgets/text/title_text.dart';

part 'home_page_view.dart';
part 'home_page_view_mixin.dart';
part 'widgets/stories_grid_list.dart';
part 'widgets/stories_carousel_list.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomePageView();
  }
}
