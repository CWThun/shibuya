import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYButton extends StatelessWidget {
  final String title;
  final bool? isWhite;
  final Function? onTouched;
  const SBYButton({Key? key, required this.title, this.onTouched, this.isWhite = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String img = (isWhite! ? 'bigWhiteButton.png' : 'pinkButton.png');
    final Color color = (isWhite! ? BUTTON_COLOR : Colors.white);
    return MaterialButton(
        textColor: Colors.white,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/${img}'), fit: BoxFit.fill),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: (isWhite! ? TEXT_FONT_SIZE : BUTTON_FONT_SIZE),
              fontWeight: FontWeight.bold,
              color: (isWhite! ? BUTTON_COLOR : Colors.white),
            ),
          ),
        ),
        onPressed: () {
          onTouched!();
        });
  }
}

class SBYNoTitleButton extends StatelessWidget {
  final String? image;
  final Function? onTouched;
  const SBYNoTitleButton({Key? key, this.image, this.onTouched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imagePath = "assets/images/$image";

    return MaterialButton(
        textColor: Colors.white,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          ),
        ),
        onPressed: () {
          onTouched!();
        });
  }
}
