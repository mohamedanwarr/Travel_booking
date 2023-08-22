import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travelbooking/Utilis/Constants.dart';

import '../../generated/l10n.dart';
import '../ProfileScreen/Widget/mainAppBar.dart';
import '../../Componant/CustomeTextfiled.dart';
import '../../Provider/GetUserDataController/Retriv_User.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.email}) : super(key: key);
  final String? email;
  @override
  Widget build(BuildContext context) {
  var  width=MediaQuery.of(context).size.width;
  var  height=MediaQuery.of(context).size.height;
  final getuser = Provider.of<RetriveUser>(context, listen: false);
  final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: MyConstant.backgroundcolor,
      body: FutureBuilder(
        future:getuser.getUserData(user!.uid) ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return const Center(child: Text('Error loading user data'));
          }else if(!snapshot.hasData){
            return const Center(child: Text('User data not found'));
          }else{
            Map<String, dynamic> userData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Customeappbar(titlename: '${userData['fullname']}',),
                  ),
                  CustomTextFormField(
                    width:width*.155 ,
                    height: height*20,
                    keyboardType: TextInputType.text,
                    labelText: S.of(context).search,
                    obscure: false, suffixicon: MyConstant.searchicon
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
