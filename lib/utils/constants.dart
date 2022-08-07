// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const double TITLE_FONT_SIZE = 25;
const double LABEL_FONT_SIZE = 16;
const double TEXT_FONT_SIZE = 20;
const double BUTTON_FONT_SIZE = 28;
const double BUTTON_FONT_SIZE_SMAL = 18;
const double BUTTON_HEIGHT = 80;
const double BUTTON_HEIGHT_LANDSCAPLE = 120;
const double NO_TITLE_BUTTON_HEIGHT = 50;

const double ALL_PADDING = 25;
const double ALL_PADDING_LANDSCAPE = 20;
const Color GRAY_COLOR = Color.fromARGB(255, 155, 154, 154);
const Color BUTTON_COLOR = Color.fromARGB(255, 246, 3, 120);

const String USER_PREF_NAME = 'User';

//画面毎のテキスト
const String CONDITION_ONE = 'コンタクトレンズは高度管理医療機器です。\n医師に指示されたレンズと同じものをご使用ください。';

const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: TITLE_FONT_SIZE);

const String HINT_EMAIL = 'メールアドレス';
const String HINT_PASSWORD = 'パスワード';
const String HINT_PASSWORD_CONFIRM = '確認のためにもう一度パスワードを入力してください。';
const String HINT_NAME = 'お客様の名前（Name）';
const String HINT_FURIGANA = 'ふりがな（例しふや　はなこ）';
const String HINT_ZIP = '郵便番号（Zip Code）';
const String HINT_ADDRESS = 'ご住所（Address）';
const String HINT_TEL = 'お電話番号（Phone）';

//お客様情報入力画面のラベル
const String SCR1_TITLE = 'お客様情報入力';
const String SCR1_CAPTION = '以下の項目をご確認いただき、\nチェックおよび記入後ご購入ください。';
const String SCR1_LABEL1 = '医療機関(眠科等)での受診はお済みですか？';
const String SCR1_LABEL2 = '済みの場合には医療機関名もご記入ください。';
const String SCR1_LABEL3 = '下記の項目をよく読み、ご理解いただけましたらチェックしてください。';
const String SCR1_MESSAGE_MISS = '医療機関名を記入してください。';
const String SCR1_MESSAGE_NOCHECK = '注意事項のすべてにチェックする必要がございます。';

//お客様情報入力画面のラベル
const String SCR2_TITLE = 'お客様情報入力';
const String SCR2_CAPTION = 'メールアドレスとパスワードを入力し、次へ進んでください。';
const String SCR2_LABEL1 = 'パスワードを忘れ方';
const String SCR2_LABEL2 = '当社からキャンペンーン等のご案内などをさせたいただく場合があります。ご了承ください。';
const String SCR2_MESSAGE_EMAIL_MISS = 'メールアドレスを記入してください。';
const String SCR2_MESSAGE_EMAIL_WRONG = 'メールの形式が間違っています。';
const String SCR2_MESSAGE_EMAIL_NOT_EXIST = 'メールアドレスは存在しません。';
const String SCR2_MESSAGE_PASSWORD_WRONG = 'パスワードは6文字以上ご記入ください。';
const String SCR2_MESSAGE_CONFIRMPASSWORD_WRONG = 'ご記入したパスワードは一致しておりません。';
const String SCR2_MESSAGE_LOGIN_WRONG = 'ご記入したメールアドレス、またはパスワードは正しくありません。';
const String SCR2_MESSAGE_PASSWORD_RESET_OK = '新しいパスワードが発行されました。メールをご確認してください。';

//お客様情報入力画面のラベル
const String SCR3_TITLE = 'お客様情報入力';
const String SCR3_CAPTION = 'お客様の個人情報を入力し、次へ進んでください。';
const String SCR3_MESSAGE_NAME_MISS = 'お名前をご記入してください。';
const String SCR3_MESSAGE_ZIP_MISS = 'お郵便番号をご記入してください。';
const String SCR3_MESSAGE_ADDRESS_MISS = 'ご住所をご記入してください。';
const String SCR3_MESSAGE_TEL_MISS = 'お電話番号をご記入してください';

//お客様情報入力画面のラベル
const String SCR4_TITLE = 'お客様情報入力';
const String SCR4_CAPTION = '商品情報を入力し、次へ進んでください。';

//お客様情報確認画面のラベル
const String SCR5_TITLE = 'お客様情報入力';
const String SCR5_CAPTION = 'お客様の個人情報を確認し、次へ進んでください。';
