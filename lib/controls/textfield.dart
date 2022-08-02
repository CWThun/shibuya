import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String value)? focused;
  bool isPassword;
  bool noPadding;
  double fontSize;
  SBYTextField(
      {Key? key,
      this.isPassword = false,
      this.noPadding = false,
      this.fontSize = TEXT_FONT_SIZE,
      this.focused,
      required this.hint,
      required this.controller})
      : super(key: key);

  void emtyFunction(String value) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !noPadding ? const EdgeInsets.all(ALL_PADDING) : const EdgeInsets.only(left: ALL_PADDING),
      child: Focus(
        onFocusChange: ((hasFocus) {
          if (!hasFocus) {
            if (focused != null) {
              focused!(controller.value.text);
            }
          }
        }),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
          decoration: !noPadding
              ? InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)))
              : InputDecoration(hintText: hint, hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize), border: InputBorder.none),
        ),
      ),
    );
  }
}
