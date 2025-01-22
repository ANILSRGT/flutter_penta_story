import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:penta_story/data/repositories/auth/auth_repository_impl.dart';
import 'package:penta_story/data/repositories/stories/stories_repository_impl.dart';
import 'package:penta_story/data/repositories/users/users_repository_impl.dart';
import 'package:penta_story/data/sources/auth/auth_remote_source.dart';
import 'package:penta_story/data/sources/stories/stories_remote_source.dart';
import 'package:penta_story/data/sources/users/users_remote_source.dart';
import 'package:penta_story/domain/repositories/auth/auth_repository.dart';
import 'package:penta_story/domain/repositories/stories/stories_repository.dart';
import 'package:penta_story/domain/repositories/users/users_repository.dart';
import 'package:penta_story/domain/usecases/auth/auth_send_email_verification_usecase.dart';
import 'package:penta_story/domain/usecases/auth/auth_send_password_reset_email_usecase.dart';
import 'package:penta_story/domain/usecases/auth/auth_sign_out_usecase.dart';
import 'package:penta_story/domain/usecases/auth/auth_sing_in_with_email_and_password_usecase.dart';
import 'package:penta_story/domain/usecases/auth/auth_sing_up_with_email_and_password_usecase.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_all_usecase.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_by_id_usecase.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_new_all_usecase.dart';
import 'package:penta_story/domain/usecases/stories/stories_get_popular_all_usecase.dart';
import 'package:penta_story/domain/usecases/users/users_create_usecase.dart';
import 'package:penta_story/domain/usecases/users/users_get_all_usecase.dart';
import 'package:penta_story/domain/usecases/users/users_get_user_by_id_usecase.dart';

final class Injection {
  Injection._init();
  static final Injection _instance = Injection._init();
  static Injection get I => _instance;

  final _sl = GetIt.instance;
  final globalKey = GlobalKey<NavigatorState>();

  Future<void> init() async {
    _sl
      //~~~ Dependencies ~~~
      ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
      ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
      //~~~ Data sources ~~~
      ..registerSingleton<StoriesRemoteSource>(StoriesRemoteSourceImpl())
      ..registerSingleton<AuthRemoteSource>(AuthRemoteSourceImpl())
      ..registerSingleton<UsersRemoteSource>(UsersRemoteSourceImpl())
      //~~~ Repositories ~~~
      ..registerSingleton<AuthRepository>(AuthRepositoryImpl())
      ..registerSingleton<StoriesRepository>(StoriesRepositoryImpl())
      ..registerSingleton<UsersRepository>(UsersRepositoryImpl())
      //~~~ Usecases ~~~
      //*** Stories ***
      ..registerSingleton<StoriesGetAllUsecase>(StoriesGetAllUsecase())
      ..registerSingleton<StoriesGetByIdUsecase>(StoriesGetByIdUsecase())
      ..registerSingleton<StoriesGetNewAllUsecase>(StoriesGetNewAllUsecase())
      ..registerSingleton<StoriesGetPopularAllUsecase>(
        StoriesGetPopularAllUsecase(),
      )
      //*** Auth ***
      ..registerSingleton<AuthSingUpWithEmailAndPasswordUsecase>(
        AuthSingUpWithEmailAndPasswordUsecase(),
      )
      ..registerSingleton<AuthSingInWithEmailAndPasswordUsecase>(
        AuthSingInWithEmailAndPasswordUsecase(),
      )
      ..registerSingleton<AuthSignOutUsecase>(AuthSignOutUsecase())
      ..registerSingleton<AuthSendEmailVerificationUsecase>(
        AuthSendEmailVerificationUsecase(),
      )
      ..registerSingleton<AuthSendPasswordResetEmailUsecase>(
        AuthSendPasswordResetEmailUsecase(),
      )
      //*** Users ***
      ..registerSingleton<UsersCreateUsecase>(UsersCreateUsecase())
      ..registerSingleton<UsersGetAllUsecase>(UsersGetAllUsecase())
      ..registerSingleton<UsersGetUserByIdUsecase>(UsersGetUserByIdUsecase());
  }

  T read<T extends Object>() => _sl.get<T>();
}
