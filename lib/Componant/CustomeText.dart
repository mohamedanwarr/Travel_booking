import 'package:flutter/material.dart';
class CustomeText extends StatelessWidget {
  const CustomeText({
    super.key, required this.text,required this.onTap, required this.texttap,
  });
  final String text;
  final String texttap;
  final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black),
          ),
          const SizedBox(
            width: 3,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              texttap,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF312DA4)),
            ),
          )
        ],
      ),
    );
  }
}
