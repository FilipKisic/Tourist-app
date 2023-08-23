import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth/login_user_use_case.dart';

class UserProvider extends ChangeNotifier {
  final LoginUserUseCase _loginUserUseCase;

  UserProvider(this._loginUserUseCase);
  
  AsyncValue<User?>? userAuthState;

  Future<void> loginUser(final String email, final String password) async {
    userAuthState = const AsyncValue.loading();
    notifyListeners();
    
    userAuthState = await AsyncValue.guard(() => _loginUserUseCase(email, password));
    notifyListeners();
  }
}