// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shibuya/dialogs/loadingdialog.dart';
import 'package:shibuya/screens/user_info.dart';
import 'package:shibuya/utils/api.dart';

import '../controls/appbar.dart';
import '../controls/button.dart';
import '../controls/textfield.dart';
import '../dialogs/alertdialog.dart';
import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({Key? key}) : super(key: key);

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SBYAppBar(title: SCR2_TITLE),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                SCR2_CAPTION,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, height: 1),
              ),
              SizedBox(height: 40),
              SBYTextField(hint: 'メールアドレス', controller: mailController),
              SBYTextField(hint: 'パスワード', controller: passwordController, isPassword: true),
              SBYTextField(hint: '確認のためにもう一度パスワードを入力してください。', controller: passwordConfirmController, isPassword: true),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  SCR2_LABEL1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 20),
              Text(SCR2_LABEL2, style: TextStyle(color: Colors.white, fontSize: LABEL_FONT_SIZE)),
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
                            onTouched: () async {
                              await moveNext(context);
                            })),
                    Positioned(
                      bottom: 40,
                      height: NO_TITLE_BUTTON_HEIGHT,
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
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

  Future<void> moveNext(BuildContext context) async {
    String errorMsg = '';
    if (mailController.value.text == '') {
      errorMsg = SCR2_MESSAGE_EMAIL_MISS;
    } else if (passwordController.value.text == '' || passwordController.value.text.length < 6) {
      errorMsg = SCR2_MESSAGE_PASSWORD_WRONG;
    } else if (passwordConfirmController.value.text != passwordController.value.text) {
      errorMsg = SCR2_MESSAGE_CONFIRMPASSWORD_WRONG;
    }
    if (errorMsg != '') {
      showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: errorMsg));
    } else {
      try {
        showDialog(context: context, builder: (context) => SBYLoading());
        var user = await ApiUtil.searchUser(mailController.value.text, passwordController.value.text);

        //final SharedPreferences prefs = await SharedPreferences.getInstance();
        //await prefs.setString(USER_PREF_NAME, json.encode(user.toMap()));

        Navigator.pop(context);
        Navigator.push(context, SlideRightRoute(page: UserInfoScreen(user: user)));
      } on Exception catch (error) {
        showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
      }
    }
  }
}
