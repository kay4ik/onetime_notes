import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  var _auth = FirebaseAuth.instance;

  Future<void> signInAnonymous() async {
    await _auth.signInAnonymously();
  }

  Future<String> userID() async {
    var user = await _auth.currentUser();
    if (user != null) return user.uid;
    else return null;
  }

  Future<void> deactivate() async {
    var user = await _auth.currentUser();
    user?.delete();
  }

  Future<void> reset() async {
    await deactivate();
    await signInAnonymous();
  }

  void init(bool createUser) async {
    if (createUser) signInAnonymous();
    else {
      if (await _auth.currentUser() != null) deactivate();
    }
  }
}