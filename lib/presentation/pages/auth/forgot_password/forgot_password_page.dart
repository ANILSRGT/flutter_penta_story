import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_vectors.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_story/presentation/widgets/dropdown/app_lang_dropdown.dart';

part 'forgot_password_page_view.dart';
part 'forgot_password_page_view_mixin.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ForgotPasswordPageView();
  }
}
