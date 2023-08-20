import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Componant/CustomeButton.dart';
import '../../Provider/LnaguageAppController/Changelanguage.dart';
import '../On_boarding/On_Boarding.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LanguageProvider>(
          builder: (context,languageProvider,child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose your Language',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    languageProvider.changeLanguage('en');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const On_Boarding()));
                  },
                  buttonText: 'English',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: 'العرابيه',
                  onPressed: () {
                    languageProvider.changeLanguage('ar');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const On_Boarding()));
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

