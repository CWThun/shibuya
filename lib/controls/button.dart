import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYButton extends StatelessWidget {
  final String title;
  final Function? onTouched;
  const SBYButton({Key? key, required this.title, this.onTouched})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        textColor: Colors.white,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/pinkButton.png'),
                fit: BoxFit.fill),
          ),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: BUTTON_FONT_SIZE, fontWeight: FontWeight.bold),
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
  const SBYNoTitleButton({Key? key, this.image, this.onTouched})
      : super(key: key);

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
            image:
                DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          ),
        ),
        onPressed: () {
          onTouched!();
        });
  }
}
