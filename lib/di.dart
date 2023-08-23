import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/auth/data/datasource/firebase/user_api.dart';
import 'package:tourist_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth/login_user_use_case.dart';
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
final loginUserUseCaseProvider = Provider<LoginUserUseCase>(
  (ref) => LoginUserUseCase(ref.read(userRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final userProvider = ChangeNotifierProvider(
  (ref) => UserProvider(ref.read(loginUserUseCaseProvider)),
);
