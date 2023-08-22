import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/ui/ProfileScreen/AccountSecurityScreen.dart';
import 'package:travelbooking/ui/ProfileScreen/LanguageEdit.dart';

import '../ authentication/Login/LoginScreen.dart';

import '../../Provider/AuthController/FirebaseServices.dart';
import '../../Provider/GetUserDataController/Retriv_User.dart';
import '../../Utilis/Constants.dart';
import '../../generated/l10n.dart';
import 'EditAccountScreen.dart';
import 'Widget/Changephoto.dart';
import 'Widget/CustomeContainer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final getuser = Provider.of<RetriveUser>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: MyConstant.backgroundcolor,
      body: FutureBuilder<Map<String, dynamic>?>(
          future: getuser.getUserData(user!.uid),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show a loading indicator
            } else if (snapshot.hasError) {
              return const Text("Error loading user data");
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Text("User data not found");
            } else {
              Map<String, dynamic> userData = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Change_photo(
                        backgroundImage:
                            NetworkImage("${userData["profileimage"]}")),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${userData['fullname']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${userData['email']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color:  Color(0xFF2E3E5C)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeContainer(
                      iconlable: FlutterIcons.person_outline_mdi,
                      textlable: S.of(context).edit_account,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditAccountScreen()));
                      },
                    ),
                     CustomeContainer(
                        iconlable: FlutterIcons.lock_open_mdi,
                        textlable: S.of(context).account_security,
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountSecurity()));
                    },),
                     CustomeContainer(
                        iconlable: FlutterIcons.language_ent,
                        textlable: S.of(context).language,
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LanguageEdit()));
                    },),
                     CustomeContainer(
                        iconlable: FlutterIcons.help_mdi, textlable: S.of(context).help),
                    CustomeContainer(
                      iconlable: FlutterIcons.log_out_ent,
                      textlable: S.of(context).logout_account,
                      onTap: () {
                        authService.signOut().then((value) =>
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  (Route<dynamic> route) => false, // This will remove all previous routes from the stack
                            ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          }),
      // body: Center(
    );
  }
}
