import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BoxIcon extends StatelessWidget {
  BoxIcon({super.key, required this.image});

  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          image,
          height: 27.0,
        ));
  }
}
