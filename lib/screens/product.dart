import 'package:flutter/material.dart';

import '../controls/appbar.dart';
import '../controls/button.dart';
import '../dialogs/shopdialog.dart';
import '../utils/constants.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SBYAppBar(title: SCR4_TITLE),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
        child: Column(children: [
          const SizedBox(height: 20),
          const Text(
            SCR4_CAPTION,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, height: 1),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(ALL_PADDING),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1.5, color: Colors.grey)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(width: 150, child: Text('店舗名', style: TextStyle(color: Colors.white, fontSize: LABEL_FONT_SIZE))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: ALL_PADDING),
                    child: TextButton(
                      child: const Text('ここに店舗名が入ります', style: TextStyle(color: Colors.white, fontSize: TITLE_FONT_SIZE)),
                      onPressed: () {
                        showDialog(context: context, builder: (context) => ShopSelectDialog());
                      },
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.touch_app, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
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
                          //Navigator.push(context, SlideRightRoute(page: const SelectUser()));
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
                      '< 前のページへ戻る',
                      style: TextStyle(fontSize: BUTTON_FONT_SIZE, color: GRAY_COLOR),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
