import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';
import 'package:penta_story/core/configs/router/app_router.dart';
import 'package:penta_story/core/utils/app_loading_dialog.dart';
import 'package:penta_story/domain/usecases/auth/auth_sign_out_usecase.dart';
import 'package:penta_story/injection.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  factory LogoutButton.icon() => const _LogoutIconButton();

  Future<void> _logout(BuildContext context) async {
    await context.showLoadingDialog(
      future: () async => Injection.I.read<AuthSignOutUsecase>().execute(),
      callback: (result) async {
        await result.when<Future<void>>(
          onSuccess: (_) async {
            if (!context.mounted) return;
            return context.router.replaceAll([const AuthenticationRoute()]);
          },
          onSuccessNegative: (_, message) async => showToast(message),
          onFail: (fail) async => showToast(fail.error.message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(AppIcons.logout),
      title: const Text('Logout'),
      onTap: () => _logout(context),
    );
  }
}

class _LogoutIconButton extends LogoutButton {
  const _LogoutIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _logout(context),
      icon: const Icon(AppIcons.logout),
    );
  }
}
