import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthServices {
  // create firebase instance -> 1
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user from firebase user with uid
  UserModel? _userWithFirebaseUID(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // create the stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUID);
  }

  // sign in anonymous -> 2
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUID(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register using email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUID(user);
    } catch (error) {
      print(
        error.toString(),
      );
      return null;
    }
  }

  // sign in using email and password
  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(
        error.toString(),
      );
      return null;
    }
  }
}
