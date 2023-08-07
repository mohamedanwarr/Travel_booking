import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/FirebaseServices.dart';
import '../../../models/UserModel.dart';
import '../../Home Screen/HomeScreen.dart';
import '../../Splash/SplashScreen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return const Center(child: Text("Something went wrong"),);
        }else if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const SplashScreen();
          } else {
            return const HomeScreen();
          }
        } else {
          // Show a loading screen if the connection state is not active
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
