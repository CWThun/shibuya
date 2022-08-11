import 'package:flutter/material.dart';
import 'package:shibuya/models/user.dart';
import 'package:shibuya/screens/user_confirm.dart';
import 'package:shibuya/utils/api.dart';

import '../controls/appbar.dart';
import '../controls/bottom_bar.dart';
import '../controls/textfield.dart';
import '../dialogs/alertdialog.dart';
import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class UserInfoScreen extends StatefulWidget {
  final User user;
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController kanaController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.value = TextEditingValue(text: widget.user.nameKanji);
    kanaController.value = TextEditingValue(text: widget.user.nameRomanji);
    zipController.value = TextEditingValue(text: widget.user.postCode);
    addressController.value = TextEditingValue(text: widget.user.address);
    phoneController.value = TextEditingValue(text: widget.user.tell);

    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ? true : false;

    return Scaffold(
      appBar: SBYAppBar(title: SCR3_TITLE, userId: widget.user.userId),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                SCR3_CAPTION,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, height: 1),
              ),
              const SizedBox(height: 40),
              SBYTextField(hint: HINT_NAME, controller: nameController),
              SBYTextField(hint: HINT_FURIGANA, controller: kanaController),
              SBYTextField(
                hint: HINT_ZIP,
                controller: zipController,
                focused: (value) async {
                  await getAddress(value);
                },
              ),
              SBYTextField(hint: HINT_ADDRESS, controller: addressController),
              SBYTextField(hint: HINT_TEL, controller: phoneController, isDigitOnly: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SBYBottomBar(
        onTouched: () {
          moveNext();
        },
      ),
    );
  }

  String check() {
    if (nameController.value.text == '') {
      return SCR3_MESSAGE_NAME_MISS;
    }
    if (zipController.value.text == '') {
      return SCR3_MESSAGE_ZIP_MISS;
    }
    if (addressController.value.text == '') {
      return SCR3_MESSAGE_ADDRESS_MISS;
    }
    if (phoneController.value.text == '') {
      return SCR3_MESSAGE_TEL_MISS;
    }
    return '';
  }

  void moveNext() {
    String errorMsg = check();
    if (errorMsg != '') {
      showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: errorMsg));
    } else {
      try {
        setState(() {
          widget.user.nameKanji = nameController.value.text;
          widget.user.nameRomanji = kanaController.value.text;
          widget.user.postCode = zipController.value.text;
          widget.user.address = addressController.value.text;
          widget.user.tell = phoneController.value.text;
        });
        Navigator.push(context, SlideRightRoute(page: UserConfirmScreen(user: widget.user)));
      } on Exception catch (error) {
        showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
      }
    }
  }

  Future<void> getAddress(String zipCode) async {
    if (zipCode == '' || zipCode.length < 7) return;
    try {
      var address = await ApiUtil.getAddress(zipCode);
      if (address.code == 200) {
        addressController.value = TextEditingValue(text: '${address.pref}${address.city}${address.town}');
      }
    } on Exception catch (error) {
      showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
    }
  }
}
