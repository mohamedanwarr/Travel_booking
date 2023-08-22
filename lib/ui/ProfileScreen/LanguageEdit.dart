import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Provider/LnaguageAppController/Changelanguage.dart';
import 'package:travelbooking/Utilis/Constants.dart';

import '../../Componant/CustomeAppBar.dart';
import '../../Componant/CustomeButton.dart';
import '../../generated/l10n.dart';

class LanguageEdit extends StatelessWidget {
  const LanguageEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final choose = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomeAppBar(
            label: S.of(context).language,
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
                          : MyConstant.maincolor,
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
                          ? MyConstant.maincolor
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
                          'العرابيه',
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
            onPressed: () async{
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
              try{
                if (choose.isContainer1Selected) {
                  await choose.saveSelectedLanguage('ar'); // Save the selected language
                  choose.changeLanguage('ar'); // Update the selected language
                } else {
                  await choose.saveSelectedLanguage('en'); // Save the selected language
                  choose.changeLanguage('en'); // Update the selected language
                }
                Navigator.pop(context); // Close the dialog
              } catch (e) {
                Navigator.pop(context); // Close the dialog
              }
            },
            buttonText: S.of(context).save,
          ),
        ],
      ),
    );
  }
}
