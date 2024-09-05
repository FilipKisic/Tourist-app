import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';
import 'package:tourist_app/features/auth/presentation/controller/state/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthUseCases _authUseCases;
  late final User? currentUser;

  @override
  AuthState build() {
    _authUseCases = ref.watch(authUseCasesProvider);
    final user = FirebaseAuth.instance.currentUser;
    currentUser = user;
    return user == null
        ? const AuthState.unauthenticated(fromSignIn: true)
        : AuthState.authenticated(user);
  }

  Future<void> login(final String email, final String password) async {
    state = const AuthState.loading();
    final result = await _authUseCases.loginUser(email, password);

    result.fold(
      (error) {
        state = AuthState.unauthenticated(error: error, fromSignIn: true);
        currentUser = null;
      },
      (user) {
        state = AuthState.authenticated(user!);
        currentUser = user;
      },
    );
  }

  Future<void> register(final String email, final String password) async {
    state = const AuthState.loading();
    final result = await _authUseCases.registerUser(email, password);

    result.fold(
      (error) {
        state = AuthState.unauthenticated(error: error, fromSignIn: false);
        currentUser = null;
      },
      (user) {
        state = AuthState.authenticated(user!);
        currentUser = user;
      },
    );
  }

  Future<void> resetPassword(final String email) async => await _authUseCases.resetPassword(email);
}
