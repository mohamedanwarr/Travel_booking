import 'package:flutter/material.dart';
import 'package:travelbooking/Utilis/Constants.dart';
class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
     required this.label,
  });

  final String ?label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyConstant.maincolor, width: 2)),
              child: MyConstant.arrowicon
            ),
          ),
        ),
        title: Text(
          "${label}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}