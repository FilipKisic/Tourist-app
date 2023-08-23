import 'package:firebase_auth/firebase_auth.dart';

class UserApi {
  final FirebaseAuth instance;

  const UserApi(this.instance);

  Future<User?> loginUser(final String email, final String password) async {
    final userCredential = await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> registerUser(final String email, final String password) async {
    final userCredential = await instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }
}
