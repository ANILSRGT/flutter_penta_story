import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/providers/user_notifier.dart';
import 'package:penta_story/injection.dart';
import 'package:provider/provider.dart';

final class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authUser = FirebaseAuth.instance.currentUser;

    if (authUser == null &&
        router.current.name != AuthenticationRoute.page.name) {
      resolver.redirect(const AuthenticationRoute());
      return;
    }

    if (authUser != null &&
        !authUser.emailVerified &&
        router.current.name != EmailVerificationRoute.page.name) {
      resolver.redirect(const EmailVerificationRoute());
      return;
    }

    final user =
        Injection.I.globalKey.currentContext?.read<UserNotifier>().user;

    if (authUser != null &&
        authUser.emailVerified &&
        user == null &&
        router.current.name != AuthProfileGeneratorRoute.page.name) {
      resolver.redirect(const AuthProfileGeneratorRoute());
      return;
    }

    if (authUser != null &&
        authUser.emailVerified &&
        user != null &&
        router.current.name == AuthProfileGeneratorRoute.page.name) {
      resolver.redirect(const HomeRoute());
      return;
    }

    resolver.next();
  }
}
