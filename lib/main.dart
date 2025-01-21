import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/cache/app_cache.dart';
import 'package:penta_story/core/configs/enums/app_localiaztions_enum.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/configs/theme/i_app_theme.dart';
import 'package:penta_story/core/localization/localization_manager.dart';
import 'package:penta_story/core/providers/theme_notifier.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/firebase_options.dart';
import 'package:penta_story/injection.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await AppCache.I.init();

  await Injection.I.init();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.I.supportedLocales,
      path: AppLocaliaztionsEnum.translationsJsonAssetsFolder,
      fallbackLocale: LocalizationManager.I.fallbackLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
          ChangeNotifierProvider(create: (_) => UserNotifier()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  void _connectivityChanged(bool hasConnection) {
    if (!hasConnection) {
      showToast(
        'No internet connection',
        backgroundColor: const Color(0xFFA80B00),
        textStyle: const TextStyle(color: Color(0xFFFBFBFB)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ConnectivityService.connectionStream.listen(_connectivityChanged);
    });
  }

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
      key: Injection.I.globalKey,
      builder: (ctx, child) {
        return OKToast(
          position: ToastPosition.bottom,
          textPadding: const EdgeInsets.all(8),
          radius: 8,
          backgroundColor: ctx.appThemeExt.appColors.black
              .byBrightness(ctx.ext.theme.isDark),
          textStyle: ctx.ext.theme.textTheme.bodyLarge!.copyWith(
            color: ctx.appThemeExt.appColors.black
                .byBrightness(ctx.ext.theme.isDark)
                .onColor,
          ),
          child: child!,
        );
      },
      routerConfig: _appRouter.config(),
    );
  }
}
