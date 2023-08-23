import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';

class AuthUseCases {
  final UserRepository _userRepository;

  const AuthUseCases(this._userRepository);

  Future<User?> loginUser(final String email, final String password) =>
      _userRepository.loginUser(email, password);

  Future<User?> registerUser(final String email, final String password) =>
      _userRepository.registerUser(email, password);
}
