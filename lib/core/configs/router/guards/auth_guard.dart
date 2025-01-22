import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/injection.dart';
import 'package:provider/provider.dart';

final class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authUser = Injection.I.read<FirebaseAuth>().currentUser;

    if (authUser == null &&
        resolver.route.name != AuthenticationRoute.page.name) {
      router.replaceAll([const AuthenticationRoute()]);
      return;
    }

    if (authUser != null &&
        !authUser.emailVerified &&
        resolver.route.name != EmailVerificationRoute.page.name) {
      router.replaceAll([const EmailVerificationRoute()]);
      return;
    }

    final user =
        Injection.I.globalKey.currentContext?.read<UserNotifier>().user;

    if (authUser != null &&
        authUser.emailVerified &&
        user == null &&
        resolver.route.name != AuthProfileGeneratorRoute.page.name) {
      router.replaceAll([const AuthProfileGeneratorRoute()]);
      return;
    }

    if (authUser != null &&
        authUser.emailVerified &&
        user != null &&
        (resolver.route.name == AuthenticationRoute.page.name ||
            resolver.route.name == EmailVerificationRoute.page.name ||
            resolver.route.name == AuthProfileGeneratorRoute.page.name)) {
      router.replaceAll([const HomeRoute()]);
      return;
    }

    resolver.next();
  }
}
