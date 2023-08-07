import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ authentication/Login/LoginScreen.dart';
import '../../Componant/CustomeButton.dart';
import '../../Provider/FirebaseServices.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.email}) : super(key: key);
  final String? email;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign in",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "email :$email",
              style: const TextStyle(fontSize: 30),
            ),
            CustomButton(
              buttonText: 'logout',
              onPressed: () {
                authService.signOut().then((value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())));
              },
            )
          ],
        ),
      ),
    );
  }
}
