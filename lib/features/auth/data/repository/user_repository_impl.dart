import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/features/auth/data/datasource/firebase/user_api.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _api;

  const UserRepositoryImpl(this._api);

  @override
  Future<Either<Failure, User?>> loginUser(final String email, final String password) async {
    try {
      final result = await _api.loginUser(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.firebaseError(e.code));
    } catch (e) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, User?>> registerUser(final String email, final String password) async {
    try {
      final result = await _api.registerUser(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.firebaseError(e.code));
    } catch (e) {
      return const Left(Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(final String email) async {
    try {
      await _api.resetPassword(email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.firebaseError(e.code));
    } catch (e) {
      return const Left(Failure.networkError());
    }
  }
}
