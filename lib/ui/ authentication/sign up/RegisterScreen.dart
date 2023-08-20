import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:travelbooking/Utilis/Validatorclass.dart';
import 'package:travelbooking/Utilis/utilis.dart';

import '../../../Componant/AnotherLogin or register.dart';
import '../../../Componant/Custome Divider.dart';
import '../../../Componant/CustomeButton.dart';
import '../../../Componant/CustomeText.dart';
import '../../../Componant/CustomeTextfiled.dart';
import '../../../Provider/AuthController/FirebaseServices.dart';

import '../../../Provider/LnaguageAppController/Changelanguage.dart';
import '../../../generated/l10n.dart';
import '../../MainScreen.dart';
import '../Login/LoginScreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _confirmPasswordController =
      TextEditingController();
  late final TextEditingController _fullnameController = TextEditingController();
  late final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isHidenPassword = true;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullnameController.dispose();
    _phoneController.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    f5.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        final authservices = Provider.of<AuthService>(context, listen: false);
        final result = await authservices.createUserWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
          _fullnameController.text,
          _phoneController.text,
        );
        Navigator.pop(context); // Close the CircularProgressIndicator dialog
        if (result != null) {
          // Registration successful, navigate to HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
          Utilis.showStyledSnackBar(S.of(context).register_user,isSuccess: true);
        }
      } on FirebaseException catch (e) {
        // Handle the sign-up error and close the CircularProgressIndicator dialog
        Navigator.pop(context);
        Utilis.showStyledSnackBar(e.message,isSuccess: false);
      }
    }
  }
  void _handleGoogleSignIn() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    final authservices = Provider.of<AuthService>(context, listen: false);
    final user = await authservices.signInWithGoogle();

    Navigator.pop(context); // Close the CircularProgressIndicator dialog

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   MainScreen()),
      );
      Utilis.showStyledSnackBar(S.of(context).google_true,isSuccess: true);
    } else {
      Utilis.showStyledSnackBar(S.of(context).google_false,isSuccess: false);
    }
  }
  void _handleFacebookSigIn() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    final authservices = Provider.of<AuthService>(context, listen: false);
    final user = await authservices.signInWithFacebook();

    Navigator.pop(context); // Close the CircularProgressIndicator dialog

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  MainScreen()),
      );
      Utilis.showStyledSnackBar(S.of(context).facebook_true,isSuccess: true);
    } else {
      Utilis.showStyledSnackBar(S.of(context).facebook_false,isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pass= Provider.of<LanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).register_desc,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: _fullnameController,
                keyboardType: TextInputType.name,
                obscure: false,
                suffixicon: const Icon(
                  Icons.person,
                  color: Color(0xFF312DA4),
                ),
                focusNode: f1,
                onChanged: (String newvalue) {
                  if (newvalue == newvalue.length) {
                    f1.unfocus();
                    FocusScope.of(context).requestFocus(f2);
                  }
                },
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return S.of(context).valid1_name;
                  } else if (!val.isValidName) {
                    return S.of(context).valid1_name;
                  }
                  return null;
                },
                labelText: S.of(context).user_name,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _phoneController,
                focusNode: f2,
                onChanged: (String newvalue) {
                  if (newvalue == newvalue.length) {
                    f2.unfocus();
                    FocusScope.of(context).requestFocus(f3);
                  }
                },
                keyboardType: TextInputType.phone,
                obscure: false,
                suffixicon: const Icon(
                  Icons.phone,
                  color: Color(0xFF312DA4),
                ),
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return S.of(context).valid1_phone;
                  } else if (!val.isValidPhone) {
                    return S.of(context).valid2_phone;
                  }
                  return null;
                },
                labelText: S.of(context).phone_account,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _emailController,
                focusNode: f3,
                onChanged: (String newvalue) {
                  if (newvalue == newvalue.length) {
                    f3.unfocus();
                    FocusScope.of(context).requestFocus(f4);
                  }
                },
                keyboardType: TextInputType.emailAddress,
                obscure: false,
                suffixicon: const Icon(
                  Icons.email,
                  color: Color(0xFF312DA4),
                ),
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return S.of(context).valid1_email;
                  } else if (!val.isValidEmail) {
                    return S.of(context).valid2_email;
                  }
                  return null;
                },
                labelText: S.of(context).email_register,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _passwordController,
                focusNode: f4,
                onChanged: (String newvalue) {
                  if (newvalue == newvalue.length) {
                    f4.unfocus();
                    FocusScope.of(context).requestFocus(f5);
                  }
                },
                keyboardType: const TextInputType.numberWithOptions(),
                obscure: pass.isHidenPassword,
                suffixicon: IconButton(
                  color: const Color(0xFF312DA4),
                  onPressed: () {
                    pass.togglePasswordcheck();
                  },
                  icon: Icon( pass.isHidenPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return S.of(context).valid1_pass;
                  } else if (val.length < 6) {
                    return S.of(context).valid2_pass;
                  }
                  return null;
                },
                labelText: S.of(context).password_register,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _confirmPasswordController,
                focusNode: f5,
                onChanged: (String newvalue) {
                  if (newvalue.length == newvalue) {
                    f5.unfocus();
                  }
                },
                keyboardType: const TextInputType.numberWithOptions(),
                obscure: pass.isHidenPassword,
                suffixicon: IconButton(
                  color: const Color(0xFF312DA4),
                  onPressed: () {
                    pass.togglePasswordcheck();
                  },
                  icon: Icon( pass.isHidenPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return S.of(context).valid1_confirmpass;
                  } else if (!val.isValidPasswordConfirm(
                      _passwordController.text,
                      _confirmPasswordController.text)) {
                    return S.of(context).valid2_confirmpass;
                  }
                  return null;
                },
                labelText: S.of(context).confirm_password,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                onPressed: () {
                  _handleRegister();
                },
                buttonText: S.of(context).register_button,
              ),
              const SizedBox(
                height: 5,
              ),
              Dividerr(
                color: Colors.grey,
                thickness: 2,
                endIndent: 6,
                indent: 6,
                text: S.of(context).another_register,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      _handleFacebookSigIn();
                    },
                    child: BoxIcon(
                      image: 'assets/images/facebook-svg.svg',
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _handleGoogleSignIn();
                    },
                    child: BoxIcon(
                      image: 'assets/images/google-svg.svg',
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomeText(text: S.of(context).have_account, onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }, texttap: S.of(context).login,)
            ],
          ),
        ),
      ),
    );
  }
}



