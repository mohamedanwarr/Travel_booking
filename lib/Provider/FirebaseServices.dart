import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travelbooking/models/UserModel.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FacebookAuth _facebookAuth=FacebookAuth();

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return User(
        uid: user.uid,
        email: user.email,
      );
    }
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final auth.UserCredential credential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String fullname, String phone) async {
    final auth.UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    final auth.User? user = credential.user;
    if (user != null) {
      // Create a new user object with custom data
      User newUser = User(
        uid: user.uid,
        email: user.email,
        fullname: fullname, // Ensure that fullname is properly set
        phone: phone, // Ensure that phone is properly set
      );

      // Add the user data to Firestore
      await _firestore.collection('users').doc(user.uid).set(newUser.toMap()!);

      return newUser;
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final auth.UserCredential authResult =
          await _firebaseAuth.signInWithCredential(credential);

      final auth.User? user = authResult.user;
      if (user != null) {
        final DocumentSnapshot<Map<String, dynamic>> userData =
            await _firestore.collection("users").doc(user.uid).get();

        if (!userData.exists) {
          // If the user is not registered, create a new user object with custom data
          User newUser = User(
            uid: user.uid,
            email: user.email,
            fullname: user.displayName,
            phone: null, // You can leave this null or set it to a default value
          );
          await _firestore
              .collection('users')
              .doc(user.uid)
              .set(newUser.toMap()!);
        }
        return _userFromFirebase(user);
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
    return null;
  }

  // Future<User?> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<User?> forgetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
    return null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
