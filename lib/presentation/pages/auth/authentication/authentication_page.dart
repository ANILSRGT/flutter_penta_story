import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/constants/app_vectors.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/extensions/validation_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/core/utils/app_loading_dialog.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_in_with_email_and_password_params.dart';
import 'package:penta_story/data/models/auth/params/auth_sign_up_with_email_and_password_params.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/domain/usecases/auth/auth_sing_in_with_email_and_password_usecase.dart';
import 'package:penta_story/domain/usecases/auth/auth_sing_up_with_email_and_password_usecase.dart';
import 'package:penta_story/domain/usecases/users/users_get_user_by_id_usecase.dart';
import 'package:penta_story/injection.dart';
import 'package:penta_story/presentation/pages/auth/authentication/authentication_page_view_model.dart';
import 'package:penta_story/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';
import 'package:penta_story/presentation/widgets/fields/app_text_form_field.dart';
import 'package:provider/provider.dart';

part 'authentication_page_view.dart';
part 'authentication_page_view_mixin.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AuthenticationPageView();
  }
}
