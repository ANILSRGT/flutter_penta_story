import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penta_story/core/configs/constants/app_vectors.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/extensions/localization_ext.dart';
import 'package:penta_story/core/localization/locale_keys.g.dart';
import 'package:penta_story/presentation/pages/auth/onboarding/widgets/onboarding_page_item.dart';

part 'onboarding_page_view.dart';
part 'onboarding_page_view_mixin.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _OnboardingPageView();
  }
}
