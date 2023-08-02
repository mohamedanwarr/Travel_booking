import 'package:flutter/material.dart';

import '../../../Shared/CustomeButton.dart';
import '../../../Shared/CustomeTextfiled.dart';
import '../../../generated/l10n.dart';
import '../../Splash/ChooseLang.dart';
import '../Login/LoginScreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isHidenPassword = true;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

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
              height: 25,
            ),
            CustomTextFormField(
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).user_name,
              keyboardType: TextInputType.name,
              obscure: false,
              suffixicon: const Icon(Icons.person,color: Color(0xFF312DA4),),
              focusNode: f1,
              onChanged: (String newvalue){
                if(newvalue == newvalue.length){
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
              onChanged: (String newvalue){
                if(newvalue == newvalue.length){
                  f2.unfocus();
                  FocusScope.of(context).requestFocus(f3);
                }
              },
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).phone_account,
              keyboardType: TextInputType.phone,
              obscure: false,
              suffixicon: const Icon(Icons.phone,color: Color(0xFF312DA4),),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              focusNode: f3,
              onChanged: (String newvalue){
                if(newvalue == newvalue.length){
                  f3.unfocus();
                  FocusScope.of(context).requestFocus(f4);
                }
              },
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).enter_email,
              keyboardType: TextInputType.emailAddress,
              obscure: false,
              suffixicon: const Icon(Icons.email,color: Color(0xFF312DA4),),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                focusNode: f4,
                onChanged: (String newvalue){
                  if(newvalue == newvalue.length){
                    f4.unfocus();
                    FocusScope.of(context).requestFocus(f5);
                  }
                },
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).enter_password,
              keyboardType: const TextInputType.numberWithOptions(),
              obscure: _isHidenPassword,
              suffixicon:IconButton(
                color: const Color(0xFF312DA4),
                onPressed: () { setState(() {
                  _isHidenPassword=!_isHidenPassword;
                }); },
                icon: Icon(_isHidenPassword?Icons.visibility:Icons.visibility_off),

              )
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                focusNode: f5,
                onChanged: (String newvalue){
                  if(newvalue == newvalue.length){
                    f5.unfocus();
                  }
                },
              width: width * 280,
              height: height * 0.078,
              hint: S.of(context).confirm_password,
              keyboardType: const TextInputType.numberWithOptions(),
              obscure: _isHidenPassword,
              suffixicon: IconButton(
                color: const Color(0xFF312DA4),
                onPressed: () { setState(() {
                  _isHidenPassword=!_isHidenPassword;
                }); },
                icon: Icon(_isHidenPassword?Icons.visibility:Icons.visibility_off),

              )
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onPressed: () {},
              buttonText: S.of(context).register_button,
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
                  S.of(context).another_register,
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
                    S.of(context).have_account,
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
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      S.of(context).login,
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
