import 'package:flutter/material.dart';
import 'package:shibuya/models/user.dart';
import 'package:shibuya/screens/product.dart';

import '../controls/appbar.dart';
import '../controls/button.dart';
import '../controls/textfield.dart';
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

    return Scaffold(
        appBar: const SBYAppBar(title: SCR3_TITLE),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                SCR3_CAPTION,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, height: 1),
              ),
              const SizedBox(height: 40),
              SBYTextField(hint: 'お客様の名前（Name）', controller: nameController),
              SBYTextField(hint: 'ふりがな（例しふや　はなこ）', controller: kanaController),
              SBYTextField(hint: '郵便番号（Zip Code）', controller: zipController),
              SBYTextField(hint: 'ご住所（Address）', controller: addressController),
              SBYTextField(hint: 'お電話番号（Phone）', controller: phoneController),
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
                              Navigator.push(context, SlideRightRoute(page: const ProductScreen()));
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
              )
            ],
          ),
        ));
  }
}
