import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_app/core/error/failure.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User?>> loginUser(final String email, final String password);
  Future<Either<Failure, User?>> registerUser(final String email, final String password);
  Future<Either<Failure, void>> resetPassword(final String email);
}