import 'package:flutter/material.dart';
import 'package:shibuya/utils/constants.dart';

class ConditionText extends StatelessWidget {
  final String title;
  const ConditionText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fSize = MediaQuery.of(context).orientation == Orientation.portrait ? 22 : 18;
    return Text(
      title,
      style: TextStyle(color: GRAY_COLOR, fontSize: fSize, fontWeight: FontWeight.bold),
    );
  }
}
