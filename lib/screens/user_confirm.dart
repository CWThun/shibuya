import 'package:flutter/material.dart';
import 'package:shibuya/controls/bottom_bar.dart';
import 'package:shibuya/controls/title.dart';
import 'package:shibuya/controls/user_label.dart';
import 'package:shibuya/screens/product.dart';
import 'package:shibuya/utils/api.dart';

import '../controls/appbar.dart';
import '../dialogs/alertdialog.dart';
import '../dialogs/loadingdialog.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class UserConfirmScreen extends StatelessWidget {
  final User user;
  const UserConfirmScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SBYAppBar(title: SCR3_TITLE, userId: user.userId),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
        child: Column(
          children: [
            const SBYScreenTitle(title: SCR5_CAPTION),
            SBYUserLabel(label: 'お客様の名前（Name）', value: user.nameKanji),
            SBYUserLabel(label: 'ふりがな', value: user.nameRomanji),
            SBYUserLabel(label: '郵便番号（Zip Code）', value: user.postCode),
            SBYUserLabel(label: 'ご住所（Address）', value: user.address),
            SBYUserLabel(label: 'お電話番号（Phone）', value: user.tell),
            SBYBottomBar(
              onTouched: () async {
                await saveUser(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveUser(BuildContext context) async {
    try {
      showDialog(context: context, builder: (context) => const SBYLoading());
      await ApiUtil.modifyUser(user);
      Navigator.pop(context);
      Navigator.push(context, SlideRightRoute(page: const ProductScreen()));
    } on Exception catch (error) {
      showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
    }
  }
}
