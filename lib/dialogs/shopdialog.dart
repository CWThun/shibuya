import 'package:flutter/material.dart';
import 'package:shibuya/models/shop.dart';
import 'package:shibuya/utils/api.dart';
import 'package:shibuya/utils/constants.dart';

import 'alertdialog.dart';

class ShopSelectDialog extends StatefulWidget {
  final ValueChanged onChanged;
  ShopSelectDialog({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<ShopSelectDialog> createState() => _ShopSelectDialogState();
}

class _ShopSelectDialogState extends State<ShopSelectDialog> {
  List<Shop> shops = List.empty();

  @override
  void initState() {
    super.initState();
    /*
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ApiUtil.getShop().then((value) => {shops = value});
    });
    */
    getShopList();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        height: MediaQuery.of(context).size.height * 2 / 3,
        child: shops.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: shops.length,
                  itemBuilder: (context, index) {
                    final shop = shops[index];
                    return ListTile(
                        title: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: (() {
                          widget.onChanged(shop.shopName);
                          Navigator.pop(context);
                        }),
                        child: Text(
                          shop.shopName,
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: TITLE_FONT_SIZE, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ));
                  },
                  separatorBuilder: (context, index) => const Divider(thickness: 1.5),
                ),
              ),
      ),
    );
  }

  Future<void> getShopList() async {
    try {
      var lst = await ApiUtil.getShop();
      setState(() {
        shops = lst;
      });
    } on Exception catch (error) {
      showDialog(context: context, builder: (context) => SBYAlert(title: 'エラー', content: error.toString()));
    }
  }
}
