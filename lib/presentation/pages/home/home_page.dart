import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/data/models/stories/params/stories_get_all_with_query_params.dart';
import 'package:penta_story/data/models/stories/story_model.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_all_usecase.dart';
import 'package:penta_story/injection.dart';
import 'package:penta_story/presentation/pages/home/home_page_view_model.dart';
import 'package:penta_story/presentation/pages/story/story_details/story_details_page.dart';
import 'package:penta_story/presentation/widgets/avatar/profile_avatar_widget.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:penta_story/presentation/widgets/searchbar/app_searchbar.dart';
import 'package:penta_story/presentation/widgets/story/story_book_image.dart';
import 'package:penta_story/presentation/widgets/story/story_grid_card.dart';
import 'package:penta_story/presentation/widgets/text/title_text.dart';
import 'package:provider/provider.dart';

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
