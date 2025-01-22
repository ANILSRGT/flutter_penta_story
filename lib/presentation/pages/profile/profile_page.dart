import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/core/utils/profie_image_picker.dart';
import 'package:penta_story/presentation/pages/profile/profile_page_view_model.dart';
import 'package:penta_story/presentation/widgets/avatar/profile_avatar_widget.dart';
import 'package:penta_story/presentation/widgets/buttons/logout_button.dart';
import 'package:penta_story/presentation/widgets/popup/app_popup_menu_button.dart';
import 'package:provider/provider.dart';

part 'profile_page_view.dart';
part 'profile_page_view_mixin.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfilePageView();
  }
}
