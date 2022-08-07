import 'package:flutter/cupertino.dart';

import 'constants.dart';

class Utils {
  static double bigButtonSize(bool isPortrait, BuildContext context) {
    return isPortrait ? MediaQuery.of(context).size.width * 2 / 3 : MediaQuery.of(context).size.width / 3;
  }

  static double captionFontSize(bool isPortrait, BuildContext context) {
    return isPortrait ? BUTTON_FONT_SIZE : TITLE_FONT_SIZE;
  }
}
