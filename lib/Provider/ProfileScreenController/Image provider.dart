
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelbooking/Utilis/PickImage.dart';
import 'package:travelbooking/Utilis/utilis.dart';

import '../../Componant/CustomeButton.dart';



class Imageprovider extends ChangeNotifier {
  Uint8List? _image;

  Uint8List? get image => _image;
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> selectImageGallery() async {
    try {
    // Set loading state to true

      Uint8List img = await pickImage(ImageSource.gallery);
      _image = img;


      // Upload the selected image to Firebase Storage and update Firestore

      String downloadURL = await uploadImageToFirebaseStorage(img);
      await updateProfileImage(downloadURL);
      if (downloadURL.isNotEmpty) {
        Utilis.showStyledSnackBar('Profile image updated', isSuccess: true);
      }
    } catch (e) {
      Utilis.showStyledSnackBar("Error selecting image: $e", isSuccess: false);
    }

      notifyListeners();

  }

  Future<void> selectImageCamera() async {
    try {

      Uint8List img = await pickImage(ImageSource.camera);
      _image = img;

      // Upload the selected image to Firebase Storage and update Firestore
      String downloadURL = await uploadImageToFirebaseStorage(img);
      await updateProfileImage(downloadURL);
      if (downloadURL.isNotEmpty) {
      }
    } catch (e) {
      Utilis.showStyledSnackBar("Error selecting image: $e", isSuccess: false);
    } // Reset loading state
      notifyListeners();

  }
  Future<String> uploadImageToFirebaseStorage(Uint8List image) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final UploadTask uploadTask = storageRef.putData(image);
    final TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> updateProfileImage(String profileImageURL) async {
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({'profileimage': profileImageURL});
      _image = null; // Clear the local image data
      notifyListeners();
    }
  }
  void setProfileImageURL(String profileImageURL) {
    _image = null; // Clear the local image data
    notifyListeners();
  }

  pickimage(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5,
              backgroundColor: const Color(0xFFffffff),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              title: const Center(child: Text("Choose Image From : ")),
              content: SizedBox(
                height: 180,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      onPressed: () {
                        selectImageGallery();
                        Navigator.pop(context);
                      },
                      buttonText: 'Gallery',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      onPressed: () {
                        selectImageCamera();
                        Navigator.pop(context);
                      },
                      buttonText: 'Camera',
                    ),
                  ],
                ),
              ));
        });
    notifyListeners();
  }




  }


