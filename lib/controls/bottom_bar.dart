import 'package:flutter/material.dart';
import 'package:shibuya/controls/button.dart';

import '../utils/constants.dart';

class SBYBottomBar extends StatelessWidget {
  final Function? onTouched;
  const SBYBottomBar({Key? key, this.onTouched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ? true : false;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: 110,
              height: isPortrait ? BUTTON_HEIGHT : BUTTON_HEIGHT - 15,
              width: isPortrait ? screenWidth * 2 / 3 : screenWidth / 3,
              child: SBYButton(
                  title: '次へ',
                  onTouched: () {
                    onTouched!();
                    //Navigator.push(context, SlideRightRoute(page: const ProductScreen()));
                    //Navigator.push(context, SlideRightRoute(page: UserConfirmScreen(user: widget.user)));
                  })),
          Positioned(
            bottom: 40,
            height: NO_TITLE_BUTTON_HEIGHT,
            width: screenWidth * 2 / 3,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '<前のページへ戻る',
                style: TextStyle(fontSize: BUTTON_FONT_SIZE, color: GRAY_COLOR),
              ),
            ),
          )
        ],
      ),
    );
  }
}
