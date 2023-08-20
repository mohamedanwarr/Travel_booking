import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/GetUserDataController/Retriv_User.dart';
class Customeappbar extends StatelessWidget {
   const Customeappbar({
    super.key, required this.titlename,
  });
  final String titlename;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title:  Text(
          'Hey, ${titlename}' ?? '',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey),
        ),
        subtitle: const Text('Where are you go?', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: Colors.black),),
        trailing: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              shape: BoxShape.circle,
              color: const Color(0xFFffffff),
              border: Border.all(color: Colors.white)),
          child: const Icon(FlutterIcons.bell_faw5,color:Color(0xFF312DA4) ,),
        ));
  }
}
