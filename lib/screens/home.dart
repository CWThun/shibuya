import 'package:flutter/material.dart';
import 'package:shibuya/controls/button.dart';
import 'package:shibuya/screens/product.dart';
import 'package:shibuya/screens/user_select.dart';

import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Default.png'), fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                bottom: 110,
                height: BUTTON_HEIGHT,
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: SBYButton(
                    title: 'スタート',
                    onTouched: () {
                      Navigator.push(context, SlideRightRoute(page: const SelectUser()));
                    })),
            Positioned(
              bottom: 40,
              height: NO_TITLE_BUTTON_HEIGHT,
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '会員登録がお済みの方はこちら >',
                  style: TextStyle(fontSize: BUTTON_FONT_SIZE, color: GRAY_COLOR),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
