import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/auth/data/datasource/firebase/user_api.dart';
import 'package:tourist_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';
import 'package:tourist_app/features/auth/presentation/riverpod/user_provider.dart';
import 'package:tourist_app/features/locations/data/api/sight_api.dart';
import 'package:tourist_app/features/locations/data/repository/sight_repository_impl.dart';
import 'package:tourist_app/features/locations/domain/repository/sight_repository.dart';
import 'package:tourist_app/features/locations/domain/usecase/sight_usecases.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/list_provider.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/state/list_state.dart';

// ***************** EXTERNAL LIBRARIES ***************** //
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final dioProvider = Provider<Dio>((ref) => Dio());

// ***************** DATASOURCE ***************** //
final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(ref.read(firebaseAuthProvider)),
);

final sightApiProvider = Provider<SightAPI>(
  (ref) => SightAPI(ref.watch(dioProvider)),
);

// ***************** REPOSITORY ***************** //
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(userApiProvider)),
);

final sightRepositoryProvider = Provider<SightRepository>(
  (ref) => SightRepositoryImpl(ref.watch(sightApiProvider)),
);

// ***************** USE CASE ***************** //
final authUseCasesProvider = Provider<AuthUseCases>(
  (ref) => AuthUseCases(ref.read(userRepositoryProvider)),
);

final sightUseCasesProvider = Provider<SightUseCases>(
  (ref) => SightUseCases(ref.watch(sightRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final userProvider = ChangeNotifierProvider.autoDispose(
  (ref) => UserProvider(ref.read(authUseCasesProvider)),
);

final sightListProvider = NotifierProvider<SightListNotifier, SightListState>(
  () => SightListNotifier(),
);
