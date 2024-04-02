import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/auth/data/datasource/firebase/user_api.dart';
import 'package:tourist_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';
import 'package:tourist_app/features/auth/presentation/controller/auth_notifier.dart';
import 'package:tourist_app/features/auth/presentation/controller/reset_password_notifier.dart';
import 'package:tourist_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:tourist_app/features/locations/data/api/sight_api.dart';
import 'package:tourist_app/features/locations/data/converter/sight_converter.dart';
import 'package:tourist_app/features/locations/data/database/hive_database_manager.dart';
import 'package:tourist_app/features/locations/data/repository/sight_repository_impl.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';
import 'package:tourist_app/features/locations/domain/usecase/sight_usecases.dart';
import 'package:tourist_app/features/locations/presentation/controller/favorite_list/favorite_list_notifier.dart';
import 'package:tourist_app/features/locations/presentation/controller/favorite_list/favorite_list_state.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/list_notifier.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/list_state.dart';

// ***************** EXTERNAL LIBRARIES ***************** //
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final dioProvider = Provider<Dio>((ref) => Dio());

// ***************** CONVERTERS ***************** //
final sightDtoToEntityConverterProvider = Provider<SightDtoToEntityConverter>(
  (ref) => SightDtoToEntityConverter(),
);

final sightEntityToDtoConverterProvider = Provider<SightEntityToDtoConverter>(
  (ref) => SightEntityToDtoConverter(),
);

// ***************** DATASOURCE ***************** //
final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(ref.read(firebaseAuthProvider)),
);

final sightApiProvider = Provider<SightAPI>(
  (ref) => SightAPI(ref.watch(dioProvider)),
);

final hiveDatabaseManagerProvider = Provider<HiveDatabaseManager>(
  (ref) => HiveDatabaseManager(),
);

// ***************** REPOSITORY ***************** //
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(userApiProvider)),
);

final sightRepositoryProvider = Provider<SightRepository>(
  (ref) => SightRepositoryImpl(
    ref.watch(sightApiProvider),
    ref.watch(hiveDatabaseManagerProvider),
    ref.watch(sightDtoToEntityConverterProvider),
  ),
);

// ***************** USE CASE ***************** //
final authUseCasesProvider = Provider<AuthUseCases>(
  (ref) => AuthUseCases(ref.watch(userRepositoryProvider)),
);

final sightUseCasesProvider = Provider<SightUseCases>(
  (ref) => SightUseCases(ref.watch(sightRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final authNotifier = NotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(),
);

final resetPasswordNotifier = NotifierProvider<ResetPasswordNotifier, AsyncValue<bool>>(
  () => ResetPasswordNotifier(),
);

final sightListProvider = NotifierProvider<SightListNotifier, ListState>(
  () => SightListNotifier(),
);

final favoriteListProvider = NotifierProvider<FavoriteListNotifier, FavoriteListState>(
  () => FavoriteListNotifier(),
);
