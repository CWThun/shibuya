import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  bool isPassword;
  SBYTextField({Key? key, this.isPassword = false, required this.hint, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ALL_PADDING),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white, fontSize: LABEL_FONT_SIZE),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: LABEL_FONT_SIZE),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
