import 'package:flutter/material.dart';
import 'package:shibuya/controls/button.dart';

import '../utils/constants.dart';

class SBYBottomBar extends StatelessWidget {
  final Function? onTouched;
  const SBYBottomBar({Key? key, this.onTouched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: 110,
              height: BUTTON_HEIGHT,
              width: MediaQuery.of(context).size.width * 2 / 3,
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
            width: MediaQuery.of(context).size.width * 2 / 3,
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
