import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(
      {super.key,
      required this.hintText,
      required this.controller,
      this.change,
      this.type,
      this.obscureText = false});
  final String hintText;
  final TextEditingController controller;
  bool obscureText;
  Function? change;
  TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      onChanged: (value) {
        if (change != null) {
          change!(value);
        }
      },
      obscureText: obscureText,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          hintText: hintText),
    );
  }
}
