import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/cache/app_cache.dart';
import 'package:penta_story/core/configs/enums/app_cache_keys_enum.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/localization/localization_manager.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/data/models/users/params/users_get_user_by_id_params.dart';
import 'package:penta_story/domain/usecases/auth/auth_sign_out_usecase.dart';
import 'package:penta_story/domain/usecases/users/users_get_user_by_id_usecase.dart';
import 'package:penta_story/injection.dart';
import 'package:penta_story/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:penta_story/presentation/widgets/logo/app_logo.dart';
import 'package:provider/provider.dart';

part 'splash_page_view.dart';
part 'splash_page_view_mixin.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashPageView();
  }
}
