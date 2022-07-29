// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shibuya/utils/constants.dart';

class SBYAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String? userId;

  @override
  final Size preferredSize;

  const SBYAppBar({Key? key, required this.title, this.userId})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: FittedBox(
        child: Padding(
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
          padding: const EdgeInsets.only(left: 20),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: TITLE_FONT_SIZE, fontFamily: 'ヒラギノ角ゴ Pro W3'),
        ),
      ),
      actions: [
        Visibility(
          visible: (userId != null && userId != ''),
          child: MaterialButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Container(
                width: 150,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/blueButton.png'), fit: BoxFit.fitWidth),
                ),
                child: const Text(
                  'ログアウト',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        )
      ],
    );
  }
}
