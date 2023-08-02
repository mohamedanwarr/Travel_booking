import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final double width;
  final double height;
  final String hint;
  final TextInputType keyboardType;
  bool obscure = false;
  final FocusNode ?focusNode;
  final Widget? suffixicon;
  final ValueChanged<String>? onChanged;

  CustomTextFormField({
    Key? key,
    required this.width,
    required this.height,
    required this.hint,
    required this.keyboardType,
    required this.suffixicon,
    required this.obscure,
     this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Local variable to track password visibility

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
          focusNode: focusNode,
          obscureText: obscure,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: hint, suffixIcon: suffixicon),
        ),
      ),
    );
  }
}
