import 'package:shibuya/utils/fields.dart';

class Shop {
  String shopId = '';
  String shopName = '';

  Shop();

  Shop.fromMap(Map<String, dynamic> map) {
    shopId = map[Fields.SHOP_ID];
    shopName = map[Fields.SHOP_NAME];
  }

  Map<String, dynamic> toMap() {
    return {
      '$Fields.SHOP_ID': shopId,
      '$Fields.SHOP_NAME': shopName,
    };
  }
}
