import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_configs.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/extensions/validation_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/core/utils/image_picker_and_crop_util.dart';
import 'package:penta_story/presentation/pages/auth/auth_profile_generator/auth_profile_generator_page_view_model.dart';
import 'package:penta_story/presentation/widgets/avatar/profile_avatar_widget.dart';
import 'package:penta_story/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/fields/app_text_form_field.dart';

part 'auth_profile_generator_page_view.dart';
part 'auth_profile_generator_page_view_mixin.dart';

@RoutePage()
class AuthProfileGeneratorPage extends StatelessWidget {
  const AuthProfileGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AuthProfileGeneratorPageView();
  }
}
