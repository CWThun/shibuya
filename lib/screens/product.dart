// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime day = DateTime.now();
  DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SBYAppBar(title: SCR4_TITLE),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
        child: Column(children: [
          const SBYScreenTitle(title: SCR4_CAPTION),
          SBYItemElement(children: [
            SBYLabel(label: '店舗名', width: 140),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: ALL_PADDING),
              child: TextButton(
                child: Text(shopName, style: textStyle),
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
              child: Align(alignment: Alignment.centerRight, child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 40)),
            )
          ]),
          SBYItemElement(children: [
            SBYLabel(label: '年月日', width: 140),
            TextButton(
                onPressed: () async {
                  await selectDate(context);
                },
                child: Text(outputFormat.format(day), style: textStyle)),
            Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      await selectDate(context);
                    },
                    child: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 40),
                  )),
            ),
          ]),
          SBYItemElement(children: [
            SBYLabel(label: 'JANコード', width: 140),
            SizedBox(
              width: 400,
              child: SBYTextField(
                hint: 'ここにJANコードが入れます。',
                controller: controller,
                noPadding: true,
                fontSize: TITLE_FONT_SIZE,
              ),
            ),
            Expanded(
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
          ]),
          SBYItemElement(
            children: [
              SBYLabel(label: '一般的名称(商品名)', width: 140),
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 160,
                    height: BUTTON_HEIGHT,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: SBYButton(title: '次へ', onTouched: () {})),
                Positioned(
                    bottom: 90,
                    height: NO_TITLE_BUTTON_HEIGHT,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: SBYButton(title: '商品を追加する', isWhite: true, onTouched: () {})),
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

  Future<void> selectDate(BuildContext context) async {
    var date = await showDatePicker(
      locale: const Locale("ja"),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now().add(const Duration(days: 360)),
    );
    setState(() {
      day = date!;
    });
  }
}
