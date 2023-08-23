import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';

class UserProvider extends ChangeNotifier {
  final AuthUseCases _authUseCases;

  UserProvider(this._authUseCases);

  AsyncValue<User?>? userAuthState;

  Future<void> loginUser(final String email, final String password) async {
    userAuthState = const AsyncValue.loading();
    notifyListeners();

    userAuthState = await AsyncValue.guard(() => _authUseCases.loginUser(email, password));
    notifyListeners();
  }

  Future<void> registerUser(
    final String email,
    final String password,
  ) async {
    userAuthState = const AsyncValue.loading();
    notifyListeners();

    try {
      userAuthState = AsyncValue.data(await _authUseCases.registerUser(email, password));
      notifyListeners();
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        userAuthState = AsyncValue.error('weak-password', StackTrace.current);
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        userAuthState = AsyncValue.error('email-already-in-use', StackTrace.current);
        notifyListeners();
      }
    } catch (e) {
      userAuthState = AsyncValue.error('There was an error', StackTrace.current);
      notifyListeners();
    }
  }
}
