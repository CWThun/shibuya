// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shibuya/controls/item_element.dart';
import 'package:shibuya/controls/textfield.dart';
import 'package:shibuya/utils/api.dart';

import '../controls/appbar.dart';
import '../controls/button.dart';
import '../controls/title.dart';
import '../controls/user_label.dart';
import '../dialogs/alertdialog.dart';
import '../dialogs/loadingdialog.dart';
import '../dialogs/shopdialog.dart';
import '../models/user.dart';
import '../utils/constants.dart';

class ProductPage extends StatefulWidget {
  final User user;
  const ProductPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController controller = TextEditingController();
  String shopName = 'ここに店舗名が入ります';
  String itemName = '';
  DateTime day = DateTime.now();
  DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ? true : false;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SBYAppBar(title: SCR4_TITLE, userId: widget.user.userId),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
        child: Column(
          children: [
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
              Expanded(
                //width: 400,
                child: SBYTextField(
                  hint: 'ここにJANコードが入れます。',
                  controller: controller,
                  noPadding: true,
                  fontSize: TITLE_FONT_SIZE,
                ),
              ),
              SizedBox(
                width: isPortrait ? screenWidth / 3.8 : screenWidth / 5.8,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () async {
                      await loadItemDetail(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: isPortrait ? screenWidth / 4 : screenWidth / 6,
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
            SBYItemElement(
              children: [
                SBYLabel(label: '一般的名称(商品名)', width: 140),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(child: Text(itemName, style: const TextStyle(fontSize: BUTTON_FONT_SIZE, color: Colors.white))),
                )
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      bottom: isPortrait ? 160 : 140,
                      height: isPortrait ? BUTTON_HEIGHT : BUTTON_HEIGHT - 15,
                      width: isPortrait ? screenWidth * 2 / 3 : screenWidth / 3,
                      child: SBYButton(title: '次へ', onTouched: () {})),
                  Positioned(
                      bottom: isPortrait ? 90 : 70,
                      height: NO_TITLE_BUTTON_HEIGHT,
                      width: isPortrait ? screenWidth * 2 / 3 : screenWidth / 3,
                      child: SBYButton(title: '商品を追加する', isWhite: true, onTouched: () {})),
                  Positioned(
                    bottom: isPortrait ? 40 : 20,
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
          ],
        ),
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

  Future<void> loadItemDetail(BuildContext context) async {
    if (controller.value.text == '') {
      showDialog(context: context, builder: (context) => const SBYAlert(title: 'エラー', content: 'JANコードをご記入してください。'));
      return;
    }
    try {
      showDialog(context: context, builder: (context) => const SBYLoading());
      final item = await ApiUtil.getItem(controller.value.text);
      Navigator.pop(context);

      if (item.code == 200) {
        setState(() {
          itemName = item.itemName;
        });
      } else {
        showDialog(context: context, builder: (context) => const SBYAlert(title: 'エラー', content: '商品検索でエラー発生しています。'));
      }
    } on Exception catch (error) {
      Navigator.pop(context);
      showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
    }
  }
}
