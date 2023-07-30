import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'ChooseLang.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        AnimatedSplashScreen(
        duration: 4000,
        splashIconSize:480,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logosplash.png',
                width: 400, height: 400),
            // Text(
            //   'Eldoseky Travel',
            //   style: TextStyle(
            //     color: Colors.indigo.shade900,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 30,
            //   ),
            // )
        ],

          ),
          nextScreen: const ChooseLang(),
        ),
      ])
    );
  }
}
