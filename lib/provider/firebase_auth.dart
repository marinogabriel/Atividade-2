import 'package:firebase_auth/firebase_auth.dart';

import '../model/jogador.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<Jogador?> get user {
    return _firebaseAuth.authStateChanges().map(
          (event) => _userFromFirebaseUser(event),
        );
  }

  Jogador? _userFromFirebaseUser(User? user) {
    return user != null ? Jogador(user.uid) : null;
  }

  Future<Jogador?> signInAnonimo() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<Jogador?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<Jogador?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
