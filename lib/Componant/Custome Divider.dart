import 'package:flutter/material.dart';
class Dividerr extends StatelessWidget {
  const Dividerr(
      {super.key,
        this.endIndent,
        required this.color,
        required this.thickness,
        this.indent, required this.text});

  final Color color;
  final String text;
  final double? endIndent;
  final double? indent;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: endIndent,
            color: color,
            thickness: thickness,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Divider(
            indent: indent,
            color: color,
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}