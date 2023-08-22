import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class RetriveUser extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection("users").doc(userId).get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }
  Future<Map<String, dynamic>?> updateUserData(String userId,Map<String,dynamic>updatedData) async {
    try {
      await _firestore.collection('users').doc(userId).update(updatedData);
// Fetch and return the updated user data
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection("users").doc(userId).get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    } catch (e) {
      // Utilis.showStyledSnackBar("Nothing change to save",isSuccess: false);

      return null;
    }
  }

}
