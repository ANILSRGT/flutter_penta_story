import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/localization/localization_manager.dart';
import 'package:penta_story/core/providers/theme_notifier.dart';
import 'package:penta_story/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.I.supportedLocales,
      path: AppLocaliaztionsEnum.translationsJsonAssetsFolder,
      fallbackLocale: LocalizationManager.I.fallbackLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme.theme.getThemeData(false),
      darkTheme: themeNotifier.currentTheme.theme.getThemeData(true),
      themeMode: themeNotifier.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: _appRouter.config(),
    );
  }
}
