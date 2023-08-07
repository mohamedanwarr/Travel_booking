import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final String ?hint;
  final String labelText;
  final TextInputType keyboardType;
  bool obscure = false;
  final FocusNode? focusNode;
  final Widget? suffixicon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  CustomTextFormField({
    Key? key,
    this.width,
    this.height,
     this.hint,
    required this.keyboardType,
    required this.labelText,
    required this.suffixicon,
    required this.obscure,
    this.focusNode,
    this.onChanged,
    this.controller,
    required this.validator, this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Local variable to track password visibility

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: TextFormField(
        onSaved: onSaved,
        autofocus: false,
        controller: controller,
        textInputAction: TextInputAction.done,
        onChanged: onChanged,
        focusNode: focusNode,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(style: BorderStyle.solid, width: 2)),
            labelText:labelText ,
            // hintText: hint,
            suffixIcon: suffixicon),
        validator: validator,
      ),
    );
  }
}
