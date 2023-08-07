// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Componant/CustomeButton.dart';
import 'package:travelbooking/Provider/FirebaseServices.dart';

import '../../../Componant/AnotherLogin or register.dart';
import '../../../Componant/Custome Divider.dart';
import '../../../Componant/CustomeText.dart';
import '../../../Componant/CustomeTextfiled.dart';
import '../../../Provider/GoogleSignin.dart';
import '../../../Utilis/utilis.dart';
import '../../../generated/l10n.dart';
import '../../Home Screen/HomeScreen.dart';
import '../ForgetPassword/ForgetPassScreen.dart';
import '../sign up/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  bool _isHidenPassword = true;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    f1.dispose();
    f2.dispose();
    super.dispose();
  }

  void _handleLogin() async {
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
        await authservices.signInWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      email: _emailController.text,
                    )));
        Utilis.showStyledSnackBar('Welcome back',isSuccess: true);
      } on FirebaseException catch (e) {
        Navigator.pop(context);
        // Handle error here and close the dialog
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
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      Utilis.showStyledSnackBar('Google sign-in Successfully',isSuccess: true);
    } else {
      Utilis.showStyledSnackBar('Google sign-in cancelled or failed',isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      S.of(context).login_desc,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  _emailController.text = value!;
                },
                keyboardType: TextInputType.emailAddress,
                obscure: false,
                suffixicon: const Icon(
                  Icons.email,
                  color: Color(0xFF312DA4),
                ),
                focusNode: f1,
                onChanged: (String newvalue) {
                  if (newvalue == newvalue.length) {
                    f1.unfocus();
                    FocusScope.of(context).requestFocus(f2);
                  }
                },
                controller: _emailController,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Enter your email please';
                  } else if (!EmailValidator.validate(email)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
                labelText: S.of(context).enter_email,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  _passwordController.text = value!;
                },
                focusNode: f2,
                onChanged: (String newvalue) {
                  if (newvalue == newvalue.length) {
                    f2.unfocus();
                  }
                },
                obscure: _isHidenPassword,
                width: width * 280,
                height: height * 0.078,
                // hint: S.of(context).enter_password,
                keyboardType: const TextInputType.numberWithOptions(),
                suffixicon: IconButton(
                  color: const Color(0xFF312DA4),
                  onPressed: () {
                    setState(() {
                      _isHidenPassword = !_isHidenPassword;
                    });
                  },
                  icon: Icon(_isHidenPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                controller: _passwordController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter Password please';
                  } else if (val.length < 6) {
                    return 'Enter min. 6 characters';
                  }
                  // else if(!val.isValidPassword){
                  //   return 'Enter valid Password';
                  // }
                  return null;
                },
                labelText: S.of(context).enter_password,
              ),
              Row(
                children: [
                  TextButton(
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Color(0xFF312DA4))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPass()));
                      },
                      child: Text(
                        S.of(context).forget_password,
                        style: const TextStyle(fontSize: 14),
                      ))
                ],
              ),
              CustomButton(
                onPressed: () {
                  _handleLogin();
                },
                buttonText: S.of(context).login,
              ),
              const SizedBox(
                height: 25,
              ),
              Dividerr(
                color: Colors.grey, thickness: 2,endIndent: 6,
                  indent: 6, text: S.of(context).another_login,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxIcon(
                    image: 'assets/images/facebook-svg.svg',
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
              CustomeText(text: S.of(context).not_have_account, onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Register()));
              }, texttap: S.of(context).register_way,)
            ],
          ),
        ),
      ),
    );
  }
}


