import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_app/features/auth/data/datasource/firebase/user_api.dart';
import 'package:tourist_app/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _api;

  const UserRepositoryImpl(this._api);

  @override
  Future<User?> loginUser(final String email, final String password) =>
      _api.loginUser(email, password);

  @override
  Future<User?> registerUser(final String email, final String password) =>
      _api.registerUser(email, password);
}
