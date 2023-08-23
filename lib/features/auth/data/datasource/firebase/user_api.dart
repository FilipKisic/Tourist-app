import 'package:firebase_auth/firebase_auth.dart';

class UserApi {
  final FirebaseAuth instance;

  const UserApi(this.instance);

  Future<User?> loginUser(final String email, final String password) async {
    final userCredential = await instance.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
    //? Think about if user is null, throw exception rather than returing the null as a value
  }
}
