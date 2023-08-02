import 'package:flutter/material.dart';

import '../../../Shared/CustomeButton.dart';
import '../../../Shared/CustomeTextfiled.dart';
import '../../Splash/ChooseLang.dart';
import '../Login/LoginScreen.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
Spacer(),
            const Row(
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    '''Don't worry! It occurs. Please enter the email address linked with your account. ''',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
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
              hint: 'Enter ',
              keyboardType: TextInputType.phone,
              suffixicon: Icon(Icons.phone), obscure: false,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onPressed: () {},
              buttonText: 'Send Code',
            ),
          ],
        ),
      ),
    );
  }
}
