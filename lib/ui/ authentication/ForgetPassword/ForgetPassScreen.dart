import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Utilis/Constants.dart';

import '../../../Componant/CustomeAppBar.dart';
import '../../../Componant/CustomeButton.dart';
import '../../../Componant/CustomeText.dart';
import '../../../Componant/CustomeTextfiled.dart';
import '../../../Provider/AuthController/FirebaseServices.dart';
import '../../../Utilis/utilis.dart';
import '../../../generated/l10n.dart';
import '../Login/LoginScreen.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handlresetpass() async {
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
        await authservices.forgetPassword(
          _emailController.text,
        );
        Navigator.pop(context);
        Utilis.showStyledSnackBar(S.of(context).reset_pass,isSuccess: true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginScreen()));
      } on FirebaseException catch (e) {
        Navigator.pop(context);
        // Handle error here and close the dialog
        Utilis.showStyledSnackBar(e.message,isSuccess: false);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomeAppBar(label: '',)),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

               Row(
                children: [
                  Text(
                    S.of(context).forget_password,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),const SizedBox(height: 20,),
               Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).forget_password_desc,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                suffixicon: MyConstant.emailicon,
                validator: (email) {
                  if (email!.isEmpty) {
                    return S.of(context).valid1_email;
                  } else if (!EmailValidator.validate(email)) {
                    return S.of(context).valid2_email;
                  }
                  return null;
                },
                labelText: S.of(context).enter_email,
                obscure: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                onPressed: () {
                  _handlresetpass();
                },
                buttonText: 'Send Code',
              ),
              const Spacer(),
              CustomeText(text: S.of(context).remember_password, onTap: () {
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
