import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';

class AuthUseCases {
  final UserRepository _userRepository;

  const AuthUseCases(this._userRepository);

  Future<Either<Failure, User?>> loginUser(final String email, final String password) =>
      _userRepository.loginUser(email, password);

  Future<Either<Failure, User?>> registerUser(final String email, final String password) =>
      _userRepository.registerUser(email, password);

  Future<Either<Failure, void>> resetPassword(final String email) =>
      _userRepository.resetPassword(email);
}
