import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYScreenTitle extends StatelessWidget {
  final String title;
  const SBYScreenTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, height: 1),
      ),
    );
  }
}
