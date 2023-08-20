import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Provider/LnaguageAppController/Changelanguage.dart';

import '../../Componant/CustomeAppBar.dart';
import '../../Componant/CustomeButton.dart';

class LanguageEdit extends StatelessWidget {
  const LanguageEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final choose = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CustomeAppBar(
            title: 'Language',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    choose.choosecolor();
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: choose.isContainer1Selected
                          ? const Color(0xffeffffff)
                          : const Color(0xFF312DA4),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'English',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: choose.isContainer1Selected
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    choose.choosecolor();
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: choose.isContainer1Selected
                          ? const Color(0xFF312DA4)
                          : const Color(0xffeffffff),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Arabic',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: choose.isContainer1Selected
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              if (choose.isContainer1Selected) {
                choose.changeLanguage('ar');
                Navigator.pop(context);// Pass the English language code
              } else {
                choose.changeLanguage('en');
                Navigator.pop(context); // Pass the Arabic language code
              }

            },
            buttonText: 'Save',
          ),
        ],
      ),
    );
  }
}
