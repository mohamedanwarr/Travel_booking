import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Utilis/utilis.dart';

import '../../Componant/CustomeAppBar.dart';
import '../../Componant/CustomeButton.dart';
import '../../Componant/CustomeTextfiled.dart';
import '../../Provider/GetUserDataController/Retriv_User.dart';
import '../../Provider/ProfileScreenController/Image provider.dart';
import '../../generated/l10n.dart';
import 'Widget/Changephoto.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _fullnameController =
      TextEditingController();
  late final TextEditingController _phoneController = TextEditingController();
  late final TextEditingController _adressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Uint8List? _selectedImage;

  @override
  void dispose() {
    _emailController.dispose();
    _adressController.dispose();
    _fullnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onSave(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Collect updated data
      final updateData = <String, dynamic>{};
      if (_fullnameController.text.isNotEmpty) {
        updateData['fullname'] = _fullnameController.text;
      }
      if (_emailController.text.isNotEmpty) {
        updateData['email'] = _emailController.text;
      }
      if (_phoneController.text.isNotEmpty) {
        updateData['phone'] = _phoneController.text;
      }
      if (_adressController.text.isNotEmpty) {
        updateData['address'] = _adressController.text;
      }
      if (_selectedImage != null) {
        updateData['profileimage'] = _selectedImage;
      }

      final updateUserData =
          await Provider.of<RetriveUser>(context, listen: false)
              .updateUserData(user.uid, updateData);

      await Future.delayed(Duration(seconds: 4));
      Navigator.pop(context); // Close the loading dialog

      if (updateUserData != null) {
        // Only show the snackbar if any changes were made
        if (updateData.isNotEmpty) {
          Utilis.showStyledSnackBar('Data updated successfully',
              isSuccess: true);
        }
      }
    } catch (e) {
      Navigator.pop(context); // Close the loading dialog
      Utilis.showStyledSnackBar('Error updating user data', isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<Imageprovider>(context);
    final getuser = Provider.of<RetriveUser>(context);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomeAppBar(
            title: 'Edit Account',
          )),
      body: FutureBuilder(
        future: getuser.getUserData(user!.uid),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text("User data not found");
          } else if (snapshot.hasError) {
            return const Text("Error loading user data");
          } else {
            Map<String, dynamic> userData = snapshot.data!;

            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Change_photo(
                        backgroundImage: _selectedImage != null
                            ? MemoryImage(_selectedImage!)
                            : NetworkImage("${userData["profileimage"]}"),
                        ontap: () async {
                          Uint8List? image =
                              await imageProvider.pickimage(context);
                          if (image != null) {
                            setState(() {
                              _selectedImage = image;
                            });
                          }
                        },
                        container: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xfffffffff),
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.blue.shade900),
                          ),
                          child: Icon(
                            FlutterIcons.camera_fea,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        controller: _fullnameController,
                        keyboardType: TextInputType.name,
                        hint: userData['fullname'] ?? S.of(context).user_name,
                        suffixicon: const Icon(
                          Icons.person,
                          color: Color(0xFF312DA4),
                        ),
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hint: userData['email'] ?? S.of(context).user_name,
                        suffixicon: const Icon(
                          Icons.email,
                          color: Color(0xFF312DA4),
                        ),
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        hint: userData['phone'] ?? "",
                        suffixicon: const Icon(
                          Icons.phone,
                          color: Color(0xFF312DA4),
                        ),
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        controller: _adressController,
                        keyboardType: TextInputType.text,
                        hint: userData['address'] ?? "",
                        suffixicon: const Icon(
                          Icons.place,
                          color: Color(0xFF312DA4),
                        ),
                        obscure: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onPressed: () {
                          _onSave(context);
                          Navigator.pop(context);
                        },
                        buttonText: 'Save',
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}


