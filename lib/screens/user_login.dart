// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shibuya/dialogs/loadingdialog.dart';
import 'package:shibuya/models/user.dart';
import 'package:shibuya/screens/user_info.dart';
import 'package:shibuya/utils/api.dart';

import '../controls/appbar.dart';
import '../controls/bottom_bar.dart';
import '../controls/textfield.dart';
import '../dialogs/alertdialog.dart';
import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class LoginUserScreen extends StatefulWidget {
  final User user;
  const LoginUserScreen({Key? key, required this.user}) : super(key: key);

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
        appBar: SBYAppBar(title: SCR2_TITLE),
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
              SBYBottomBar(
                onTouched: () async {
                  await moveNext(context);
                },
              ),
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
        var loginUser = await ApiUtil.searchUser(mailController.value.text, passwordController.value.text);

        Navigator.pop(context);

        //メールかパスワードは間違い
        if (loginUser.code == 202) {
          showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: SCR2_MESSAGE_LOGIN_WRONG));
          return;
        }
        //新規
        else if (loginUser.code == 203) {
          loginUser = User();
        }
        loginUser.medicalInstitution = widget.user.medicalInstitution;
        loginUser.password = passwordController.value.text;
        loginUser.email = mailController.value.text;

        Navigator.push(context, SlideRightRoute(page: UserInfoScreen(user: loginUser)));
      } on Exception catch (error) {
        Navigator.pop(context);
        showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
      }
    }
  }
}
