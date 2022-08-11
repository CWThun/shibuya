import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants.dart';

class SBYTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String value)? focused;
  bool isPassword;
  bool isNumber;
  bool isDigitOnly;
  bool noPadding;
  double fontSize;
  SBYTextField(
      {Key? key,
      this.isPassword = false,
      this.noPadding = false,
      this.isNumber = false,
      this.isDigitOnly = false,
      this.fontSize = TEXT_FONT_SIZE,
      this.focused,
      required this.hint,
      required this.controller})
      : super(key: key);

  void emtyFunction(String value) {}

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ? true : false;
    return Padding(
      padding: !noPadding
          ? (isPortrait
              ? const EdgeInsets.all(ALL_PADDING)
              : const EdgeInsets.only(left: ALL_PADDING, right: ALL_PADDING, bottom: ALL_PADDING_LANDSCAPE))
          : const EdgeInsets.only(left: ALL_PADDING),
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
          keyboardType: inputType(),
          inputFormatters: isDigitOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
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

  TextInputType inputType() {
    if (isNumber) return const TextInputType.numberWithOptions(decimal: false, signed: false);
    if (isDigitOnly) return TextInputType.number;
    return TextInputType.text;
  }
}
