import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signinwith(String email, String pass) async {
    try {
      UserCredential res =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      print("Response");
      print(res);
      User? user = res.user;

      return Users(user: user);
    } catch (e) {
      print("Auth error :" + e.toString());
      return null;
    }
  }
}
