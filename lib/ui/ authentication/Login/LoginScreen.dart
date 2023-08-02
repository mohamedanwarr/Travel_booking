// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../../Shared/CustomeButton.dart';
import '../../../Shared/CustomeTextfiled.dart';
import '../../../generated/l10n.dart';
import '../../Splash/ChooseLang.dart';
import '../ForgetPassword/ForgetPassScreen.dart';
import '../sign up/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidenPassword = true;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).enter_email,
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
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              focusNode: f2,
              onChanged: (String newvalue) {
                if (newvalue == newvalue.length) {
                  f2.unfocus();
                }
              },
              obscure: _isHidenPassword,
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).enter_password,
              keyboardType: const TextInputType.numberWithOptions(),
              suffixicon: IconButton(
                color: const Color(0xFF312DA4),
                onPressed: () {
                  setState(() {
                    _isHidenPassword = !_isHidenPassword;
                  });
                },
                icon: Icon(
                    _isHidenPassword ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            Row(
              children: [
                TextButton(
                    style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(Color(0xFF312DA4))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPass()));
                    },
                    child: Text(
                      S.of(context).forget_password,
                      style: const TextStyle(fontSize: 14),
                    ))
              ],
            ),
            CustomButton(
              onPressed: () {},
              buttonText: S.of(context).login,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    endIndent: 6,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Text(
                  S.of(context).another_login,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Expanded(
                  child: Divider(
                    indent: 6,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 116,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/facebook_889100.png',
                    height: 20,
                    width: 26,
                  ),
                ),
                Container(
                  width: 116,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/google_2702602.png',
                    height: 800,
                  ),
                ),
                Container(
                  width: 116,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image:
                              AssetImage('assets/images/phone_8220624.png'))),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).not_have_account,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text(
                      S.of(context).register_button,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF312DA4)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

