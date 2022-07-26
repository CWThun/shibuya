import 'package:flutter/material.dart';
import 'package:shibuya/utils/constants.dart';

class SBYAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  @override
  final Size preferredSize;
  const SBYAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.scaleDown,
          ),
          padding: const EdgeInsets.only(left: 20, top: 13, bottom: 13),
        ),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: TITLE_FONT_SIZE, fontFamily: 'ヒラギノ角ゴ Pro W3'),
          ),
        ));
  }
}
