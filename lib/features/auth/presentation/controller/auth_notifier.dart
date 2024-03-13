import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';
import 'package:tourist_app/features/auth/presentation/controller/state/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthUseCases _authUseCases;

  @override
  AuthState build() {
    _authUseCases = ref.watch(authUseCasesProvider);
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser == null
        ? const AuthState.unauthenticated(fromSignIn: true)
        : AuthState.authenticated(currentUser);
  }

  Future<void> login(final String email, final String password) async {
    state = const AuthState.loading();
    final result = await _authUseCases.loginUser(email, password);

    result.fold(
      (error) => state = AuthState.unauthenticated(error: error, fromSignIn: true),
      (user) => state = AuthState.authenticated(user!),
    );
  }

  Future<void> register(final String email, final String password) async {
    state = const AuthState.loading();
    final result = await _authUseCases.registerUser(email, password);

    result.fold(
      (error) => state = AuthState.unauthenticated(error: error, fromSignIn: false),
      (user) => state = AuthState.authenticated(user!),
    );
  }

  Future<void> resetPassword(final String email) async => await _authUseCases.resetPassword(email);
}
