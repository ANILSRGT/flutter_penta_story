import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_configs.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/extensions/validation_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/core/utils/app_loading_dialog.dart';
import 'package:penta_story/core/utils/profie_image_picker.dart';
import 'package:penta_story/data/models/users/params/users_create_params.dart';
import 'package:penta_story/data/models/users/user_model.dart';
import 'package:penta_story/domain/usecases/users/users_create_usecase.dart';
import 'package:penta_story/injection.dart';
import 'package:penta_story/presentation/pages/auth/auth_profile_generator/auth_profile_generator_page_view_model.dart';
import 'package:penta_story/presentation/widgets/avatar/profile_avatar_widget.dart';
import 'package:penta_story/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_story/presentation/widgets/buttons/logout_button.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/fields/app_text_form_field.dart';
import 'package:provider/provider.dart';

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
