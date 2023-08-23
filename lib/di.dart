import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/auth/data/datasource/firebase/user_api.dart';
import 'package:tourist_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';
import 'package:tourist_app/features/auth/presentation/riverpod/user_provider.dart';

// ***************** EXTERNAL LIBRARIES ***************** //
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// ***************** DATASOURCE ***************** //
final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(ref.read(firebaseAuthProvider)),
);

// ***************** REPOSITORY ***************** //
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(userApiProvider)),
);

// ***************** USE CASE ***************** //
final loginUserUseCaseProvider = Provider<AuthUseCases>(
  (ref) => AuthUseCases(ref.read(userRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final userProvider = ChangeNotifierProvider.autoDispose(
  (ref) => UserProvider(ref.read(loginUserUseCaseProvider)),
);
