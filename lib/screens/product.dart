// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:shibuya/controls/item_element.dart';
import 'package:shibuya/controls/textfield.dart';

import '../controls/appbar.dart';
import '../controls/button.dart';
import '../controls/title.dart';
import '../controls/user_label.dart';
import '../dialogs/shopdialog.dart';
import '../utils/constants.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController controller = TextEditingController();
  String shopName = 'ここに店舗名が入ります';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SBYAppBar(title: SCR4_TITLE),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
        child: Column(children: [
          const SBYScreenTitle(title: SCR4_CAPTION),
          SBYItemElement(children: [
            const SBYLabel(label: '店舗名'),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: ALL_PADDING),
              child: TextButton(
                child: Text(shopName, style: const TextStyle(color: Colors.white, fontSize: TITLE_FONT_SIZE)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => ShopSelectDialog(
                            onChanged: (value) {
                              setState(() {
                                shopName = value;
                              });
                            },
                          ));
                },
              ),
            ),
            const Expanded(
              child: Align(alignment: Alignment.centerRight, child: Icon(Icons.touch_app, color: Colors.white)),
            )
          ]),
          SBYItemElement(children: [
            const SBYLabel(label: '店舗名'),
            SizedBox(
              width: 300,
              child: SBYTextField(
                hint: 'ここにJANコードが入れます。',
                controller: controller,
                noPadding: true,
                fontSize: TITLE_FONT_SIZE,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/smallWhiteButton.png'), fit: BoxFit.fill),
                    ),
                    child: const Text(
                      '呼び出し',
                      style: TextStyle(color: BUTTON_COLOR, fontSize: BUTTON_FONT_SIZE_SMAL, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ]),
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
