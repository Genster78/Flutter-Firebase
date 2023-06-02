import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // create firebase instance -> 1
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymous -> 2
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register using email and password
  // sign in using email and password
  // sign out
}
