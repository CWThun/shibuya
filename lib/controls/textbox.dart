import 'package:flutter/material.dart';
import 'package:shibuya/utils/constants.dart';

class ConditionText extends StatelessWidget {
  final String title;
  const ConditionText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: GRAY_COLOR, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
