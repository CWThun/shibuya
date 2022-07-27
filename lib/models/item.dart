import '../utils/fields.dart';

class ItemInfo {
  String itemId = '';
  String itemCode = '';
  String itemName = '';
  int code = 0;

  ItemInfo();

  ItemInfo.fromMap(Map<String, dynamic> map) {
    itemId = map[Fields.ITEM_ID];
    itemCode = map[Fields.ITEM_CODE];
    itemName = map[Fields.ITEM_NAME];
    code = 200;
  }

  ItemInfo.fromCode(int code) {
    code = code;
  }

  Map<String, dynamic> toMap() {
    return {
      '$Fields.ITEM_ID': itemId,
      '$Fields.ITEM_CODE': itemCode,
      '$Fields.ITEM_NAME': itemName,
    };
  }
}
