import 'package:flutter/material.dart';
import 'package:travelbooking/Utilis/Constants.dart';
class Dividerr extends StatelessWidget {
  const Dividerr(
      {super.key,
  required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 6,
            color: MyConstant.subcolortext,
            thickness: 2,
          ),
        ),
        Text(
          text,
          style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: MyConstant.maincolortext),
        ),
        Expanded(
          child: Divider(
            indent: 6,
            color: MyConstant.subcolortext,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}