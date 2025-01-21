import 'package:auto_route/auto_route.dart';
import 'package:penta_story/core/configs/router/guards/auth_guard.dart';
import 'package:penta_story/presentation/pages/auth/auth_profile_generator/auth_profile_generator_page.dart';
import 'package:penta_story/presentation/pages/auth/authentication/authentication_page.dart';
import 'package:penta_story/presentation/pages/auth/email_verification/email_verification_page.dart';
import 'package:penta_story/presentation/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:penta_story/presentation/pages/auth/onboarding/onboarding_page.dart';
import 'package:penta_story/presentation/pages/auth/splash/splash_page.dart';
import 'package:penta_story/presentation/pages/home/home_page.dart';
import 'package:penta_story/presentation/pages/profile/profile_page.dart';
import 'package:penta_story/presentation/pages/story/story_book/story_book_page.dart';
import 'package:penta_story/presentation/pages/story/story_details/story_details_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: EmailVerificationRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: AuthProfileGeneratorRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: AuthenticationRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: HomeRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: StoryDetailsRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: StoryBookRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ProfileRoute.page,
          guards: [AuthGuard()],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
