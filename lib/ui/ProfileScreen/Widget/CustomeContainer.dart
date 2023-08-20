import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
class CustomeContainer extends StatelessWidget {
  const CustomeContainer({
    super.key,
    required this.iconlable,
    required this.textlable,
    this.onTap,
  });

  final IconData iconlable;
  final String textlable;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xfffffffff),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  (iconlable),
                  color: const Color(0xFF312DA4),
                  size: 27,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    textlable,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
                const Icon((FlutterIcons.arrow_right_mco),
                    color: Color(0xFF312DA4), size: 27)
              ],
            ),
          ),
        ),
      ),
    );
  }
}