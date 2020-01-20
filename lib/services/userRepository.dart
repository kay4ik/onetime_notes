import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  var _auth = FirebaseAuth.instance;

  void signInAnonymous() async {
    await _auth.signInAnonymously();
  }

  Future<String> userID() async {
    var user = await _auth.currentUser();
    if (user != null) return user.uid;
    else return null;
  }
}