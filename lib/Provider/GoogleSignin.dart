// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../ui/Home Screen/HomeScreen.dart';
//
// class GoogleSigninProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();
//
//   GoogleSignInAccount? _user;
//
//   GoogleSignInAccount get user => _user!;
//   Future<void> googlelogin(BuildContext context) async {
//     try {
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser != null) {
//         final googleAuth = await googleUser.authentication;
//
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         _user = googleUser;
//         notifyListeners();
//
//         // Navigate to HomeScreen after successful sign-in
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => HomeScreen()),
//         );
//       } else {
//         // User canceled the sign-in process, you can show a message or take appropriate action.
//         print("Google Sign-In was canceled.");
//       }
//     } catch (error) {
//       // Handle the error here and show an appropriate error message to the user.
//       print("Error during Google Sign-In: $error");
//     }
//   }
// }
