// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:shibuya/models/shop.dart';
import 'package:shibuya/utils/fields.dart';

import '../models/item.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

const String ROOT_PATH = 'http://sby-info.com';
const String API_USER_SEARCH = 'api/user.json';
const String API_SHOP_LIST = 'api/shop.json';
const String API_ITEM_DETAIL = 'api/item.json';
const String API_EDIT_USER = 'api/add_user.json';

const headers = <String, String>{'content-type': 'application/json'};

class ApiUtil {
  ///ユーザ取得
  ///@email メール
  ///@password パスワード
  static Future<User> searchUser(String email, String password) async {
    try {
      final ret = await post(API_USER_SEARCH, {Fields.USER_EMAIL: email, 'password': password});
      var body = json.decode(ret) as Map;
      final int code = body['code'];
      //ユーザ存在
      if (code == 200) {
        return User.fromMap(body['profile']);
      } else {
        return User.fromCode(code);
      }
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  ///ユーザ登録
  ///@user ユーザ情報
  static Future<int> modifyUser(User user) async {
    var param = user.toMap();
    try {
      final ret = await post(API_EDIT_USER, param);
      var body = json.decode(ret) as Map;
      final int code = body['code'];
      //ユーザ存在
      return code;
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  ///店舗取得
  static Future<List<Shop>> getShop() async {
    try {
      final ret = await get(API_SHOP_LIST);
      var body = json.decode(ret) as Map;
      final int code = body['code'];
      //ユーザ存在
      if (code == 200) {
        var lst = body['shops'] as List<dynamic>;
        return lst.map((e) => Shop.fromMap(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  ///商品情報取得
  ///@itemCode 商品コード
  static Future<ItemInfo> getItem(String itemCode) async {
    try {
      final ret = await post(API_ITEM_DETAIL, {'item_code': itemCode});
      var body = json.decode(ret) as Map;
      final int code = body['code'];
      //ユーザ存在
      if (code == 200) {
        return ItemInfo.fromMap(body['item']);
      } else {
        return ItemInfo.fromCode(code);
      }
    } on Exception catch (error) {
      throw Exception(error);
    }
  }

  static Future<String> safeApiCall(Function callback) async {
    try {
      final response = await callback() as http.Response;
      return parseResponse(response.statusCode, response.body);
    } on SocketException {
      throw Exception('No Internet Connection');
    }
  }

  static Future<String> get(String endpoint) async {
    var url = Uri.parse("$ROOT_PATH/$endpoint");
    return safeApiCall(() async => http.get(url));
  }

  static Future<String> post(String endpoint, dynamic body) async {
    var url = Uri.parse("$ROOT_PATH/$endpoint");
    return safeApiCall(() async => http.post(url, headers: headers, body: json.encode(body)));
  }

  static String parseResponse(int httpStatus, String responseBody) {
    switch (httpStatus) {
      case 200:
      case 201:
        return responseBody;
      case 400:
        throw Exception('400 Bad Request');
      case 401:
        throw Exception('401 Unauthorized');
      case 403:
        throw Exception('403 Forbidden');
      case 404:
        throw Exception('404 Not Found');
      case 405:
        throw Exception('405 Method Not Allowed');
      case 500:
        throw Exception('500 Internal Server Error');
      default:
        throw Exception('Http status $httpStatus unknown error.');
    }
  }
}
