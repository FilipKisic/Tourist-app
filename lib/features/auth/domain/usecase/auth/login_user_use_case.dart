import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';

class LoginUserUseCase {
  final UserRepository _userRepository;

  const LoginUserUseCase(this._userRepository);

  Future<User?> call(final String email, final String password) =>
      _userRepository.loginUser(email, password);
}
