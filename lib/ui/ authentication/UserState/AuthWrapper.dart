import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AuthController/FirebaseServices.dart';
import '../../../Provider/LnaguageAppController/Changelanguage.dart';
import '../../../Provider/NavigationBarController/MainScreenProvider.dart';
import '../../../models/UserModel.dart';
import '../../MainScreen.dart';
import '../../Splash/SplashScreen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final load=Provider.of<LanguageProvider>(context);
    final mainScreenProvider = Provider.of<MainScreenProvider>(context, listen: false);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
mainScreenProvider.setpageIndex(0);
            return  const SplashScreen();
          } else {
            return load.isloading?const CircularProgressIndicator(): MainScreen();
          }
        } else {
          // Show a loading screen if the connection state is not active
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
