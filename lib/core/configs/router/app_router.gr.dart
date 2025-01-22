// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthProfileGeneratorPage]
class AuthProfileGeneratorRoute extends PageRouteInfo<void> {
  const AuthProfileGeneratorRoute({List<PageRouteInfo>? children})
      : super(
          AuthProfileGeneratorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthProfileGeneratorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthProfileGeneratorPage();
    },
  );
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthenticationPage();
    },
  );
}

/// generated route for
/// [EmailVerificationPage]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmailVerificationPage();
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [StoryBookPage]
class StoryBookRoute extends PageRouteInfo<StoryBookRouteArgs> {
  StoryBookRoute({
    required StoryBookPageArgs args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StoryBookRoute.name,
          args: StoryBookRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryBookRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StoryBookRouteArgs>();
      return StoryBookPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class StoryBookRouteArgs {
  const StoryBookRouteArgs({
    required this.args,
    this.key,
  });

  final StoryBookPageArgs args;

  final Key? key;

  @override
  String toString() {
    return 'StoryBookRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [StoryDetailsPage]
class StoryDetailsRoute extends PageRouteInfo<StoryDetailsRouteArgs> {
  StoryDetailsRoute({
    required StoryDetailsPageArgs args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StoryDetailsRoute.name,
          args: StoryDetailsRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StoryDetailsRouteArgs>();
      return StoryDetailsPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class StoryDetailsRouteArgs {
  const StoryDetailsRouteArgs({
    required this.args,
    this.key,
  });

  final StoryDetailsPageArgs args;

  final Key? key;

  @override
  String toString() {
    return 'StoryDetailsRouteArgs{args: $args, key: $key}';
  }
}
