import 'package:flutter/material.dart';
import 'package:shibuya/utils/fields.dart';

class User {
  String userId = '';
  String password = '';
  String nameKanji = '';
  String nameRomanji = '';
  String postCode = '';
  String address = '';
  String tell = '';
  String medicalInstitution = '';
  String signature = '';
  int code = 0;

  User({Key? key});

  User.fromMap(Map<String, dynamic> map) {
    userId = map[Fields.USER_ID];
    password = map[Fields.USER_PASSWORD];
    nameKanji = map[Fields.USER_NAME_KANJI];
    nameRomanji = map[Fields.USER_NAME_ROMAJI];
    postCode = map[Fields.USER_POSTCODE];
    address = map[Fields.USER_ADDRESS];
    tell = map[Fields.USER_TELL];
    signature = map[Fields.USER_SIGNATURE];
  }

  User.fromCode(int responseCode) {
    code = responseCode;
  }

  Map<String, dynamic> toMap() {
    return {
      '${Fields.USER_ID}': userId,
      '${Fields.USER_PASSWORD}': password,
      '${Fields.USER_NAME_KANJI}': nameKanji,
      '${Fields.USER_NAME_ROMAJI}': nameRomanji,
      '${Fields.USER_POSTCODE}': postCode,
      '${Fields.USER_ADDRESS}': address,
      '${Fields.USER_TELL}': tell,
      '${Fields.USER_MEDICAL}': medicalInstitution
    };
  }
}
