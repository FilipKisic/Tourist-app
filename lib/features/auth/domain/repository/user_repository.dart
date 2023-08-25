import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserRepository {
  Future<User?> loginUser(final String email, final String password);
  Future<User?> registerUser(final String email, final String password);
  Future<void> resetPassword(final String email);
}