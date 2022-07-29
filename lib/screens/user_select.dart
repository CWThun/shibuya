// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shibuya/controls/textfield.dart';
import 'package:shibuya/dialogs/alertdialog.dart';
import 'package:shibuya/models/user.dart';
import 'package:shibuya/screens/user_info.dart';
import 'package:shibuya/screens/user_login.dart';

import '../controls/appbar.dart';
import '../controls/button.dart';
import '../controls/textbox.dart';
import '../utils/constants.dart';
import '../utils/slide_navigator.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  bool isAlready = true;
  bool chooseOne = false;
  bool chooseTwo = false;
  bool chooseThree = false;
  TextEditingController medicanName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SBYAppBar(title: SCR1_TITLE),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 0, 1)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                SCR1_CAPTION,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: BUTTON_FONT_SIZE, height: 1),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: ALL_PADDING, top: ALL_PADDING),
                  child: Text(SCR1_LABEL1, style: TextStyle(color: Colors.white, fontSize: LABEL_FONT_SIZE)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(ALL_PADDING),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isAlready = !isAlready;
                          });
                        },
                        child: Text(
                          '済',
                          style: TextStyle(fontSize: BUTTON_FONT_SIZE, color: isAlready ? Colors.white : GRAY_COLOR),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: isAlready ? Color.fromARGB(255, 246, 3, 120) : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(ALL_PADDING), bottomLeft: Radius.circular(ALL_PADDING))),
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isAlready = !isAlready;
                            });
                          },
                          child: Text('未', style: TextStyle(fontSize: BUTTON_FONT_SIZE, color: isAlready ? GRAY_COLOR : Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: isAlready ? Colors.white : Color.fromARGB(255, 246, 3, 120),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(ALL_PADDING), bottomRight: Radius.circular(ALL_PADDING))),
                          )),
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: ALL_PADDING, top: ALL_PADDING),
                    child: Visibility(
                      visible: isAlready,
                      child: Text(SCR1_LABEL2, style: TextStyle(color: Colors.white, fontSize: LABEL_FONT_SIZE)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: isAlready,
                  child: SBYTextField(hint: '医療機関名', controller: medicanName),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(left: ALL_PADDING, top: ALL_PADDING),
                    child: Text(SCR1_LABEL3, style: TextStyle(color: Colors.white, fontSize: LABEL_FONT_SIZE))),
              ),
              Padding(
                padding: const EdgeInsets.all(ALL_PADDING),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3.2,
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/listBackground.png'), fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: ALL_PADDING, right: ALL_PADDING),
                              child: Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  value: chooseOne,
                                  onChanged: (value) {
                                    setState(() {
                                      chooseOne = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            ConditionText(title: CONDITION_ONE)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: ALL_PADDING, right: ALL_PADDING),
                              child: Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  value: chooseTwo,
                                  onChanged: (value) {
                                    setState(() {
                                      chooseTwo = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            ConditionText(title: CONDITION_ONE)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: ALL_PADDING, right: ALL_PADDING),
                              child: Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  value: chooseThree,
                                  onChanged: (value) {
                                    setState(() {
                                      chooseThree = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            ConditionText(title: CONDITION_ONE)
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: BUTTON_HEIGHT + 15,
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: SBYButton(
                    title: '次へ',
                    onTouched: () {
                      String errorMsg = '';
                      if (isAlready && medicanName.value.text == '') {
                        errorMsg = SCR1_MESSAGE_MISS;
                      } else if (!chooseOne || !chooseTwo || !chooseThree) {
                        errorMsg = SCR1_MESSAGE_NOCHECK;
                      }
                      if (errorMsg != '') {
                        showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: errorMsg));
                      } else {
                        final User user = User();
                        user.medicalInstitution = medicanName.value.text;
                        Navigator.push(context, SlideRightRoute(page: LoginUserScreen(user: user)));
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
