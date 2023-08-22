import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Utilis/Constants.dart';
import 'package:travelbooking/Utilis/utilis.dart';

import '../../Componant/CustomeAppBar.dart';
import '../../Componant/CustomeButton.dart';
import '../../Componant/CustomeTextfiled.dart';
import '../../Provider/LnaguageAppController/Changelanguage.dart';
import '../../generated/l10n.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({Key? key}) : super(key: key);

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _newpasswordController =
  TextEditingController();
  late final TextEditingController _oldpasswordController =
  TextEditingController();
  late final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _newpasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePassword() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final authCredential = EmailAuthProvider.credential(
              email: user.email!, password: _oldpasswordController.text);

          await user.reauthenticateWithCredential(authCredential);
          await user.updatePassword(_newpasswordController.text);
          Navigator.pop(context); // Close the loading dialog
          Utilis.showStyledSnackBar(
              "Password changed successfully", isSuccess: true);

          _formKey.currentState!.reset();
          _oldpasswordController.clear();
          _newpasswordController.clear();
          _confirmPasswordController.clear();
        }
      } catch (e) {
        Navigator.pop(context); // Close the loading dialog
        Utilis.showStyledSnackBar(
            "Error changing password: ${e.toString()}", isSuccess: false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pass = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      resizeToAvoidBottomInset: false,
      appBar:    PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomeAppBar(
          label: S.of(context).account_security,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: _oldpasswordController,
                  keyboardType:  TextInputType.text,
                  obscure: pass.isHidenPassword,
                  suffixicon: IconButton(
                    color: MyConstant.maincolor,
                    icon: Icon(pass.isHidenPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      pass.togglePasswordcheck();
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your old password";
                    }
                    return null;
                  },
                  labelText: 'Old Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _newpasswordController,
                  keyboardType:  TextInputType.text,
                  obscure: pass.isHidenPassword,
                  suffixicon: IconButton(
                    color: MyConstant.maincolor,
                    icon: Icon(pass.isHidenPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      pass.togglePasswordcheck();
                    },
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return S.of(context).valid1_pass;
                    } else if (val.length < 6) {
                      return S.of(context).valid2_pass;
                    }
                    return null;
                  },
                  labelText: 'New Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  keyboardType:  TextInputType.text,
                  obscure: pass.isHidenPassword,
                  suffixicon: IconButton(
                    color: MyConstant.maincolor,
                    onPressed: () {
                      pass.togglePasswordcheck();
                    },
                    icon: Icon(pass.isHidenPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value != _newpasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  labelText: S.of(context).confirm_password,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    _updatePassword();
                  },
                  buttonText: S.of(context).save,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
