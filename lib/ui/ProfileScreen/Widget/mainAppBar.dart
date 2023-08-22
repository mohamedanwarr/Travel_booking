import 'package:flutter/material.dart';
import 'package:travelbooking/Utilis/Constants.dart';

import '../../../generated/l10n.dart';

class Customeappbar extends StatelessWidget {
   const Customeappbar({
    super.key, required this.titlename,
  });
  final String titlename;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title:  Text(
          '${S.of(context).hey}, $titlename',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color:  Color(0xFF2E3E5C)),
        ),
        subtitle:  Text(S.of(context).where, style: const TextStyle(
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
          child:  MyConstant.billicon
        ));
  }
}
