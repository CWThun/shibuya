import 'package:flutter/material.dart';
import 'package:shibuya/controls/button.dart';
import 'package:shibuya/models/user.dart';
import 'package:shibuya/screens/product_screen.dart';
import 'package:shibuya/screens/user_select.dart';
import 'package:shibuya/utils/util.dart';

import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ? true : false;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 35, 0, 1),
            image: DecorationImage(image: AssetImage('assets/images/Default.png'), fit: BoxFit.contain),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  bottom: 110,
                  height: BUTTON_HEIGHT,
                  width: Utils.bigButtonSize(isPortrait, context),
                  child: SBYButton(
                      title: 'スタート',
                      onTouched: () {
                        Navigator.push(context, SlideRightRoute(page: const SelectUser()));
                        //Navigator.push(context, SlideRightRoute(page: ProductScreen(user: User())));
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
      ),
    );
  }
}
