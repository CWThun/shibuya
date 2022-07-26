import 'package:flutter/material.dart';

class SBYLoading extends StatelessWidget {
  const SBYLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7), child: const Text("実行中...")),
        ],
      ),
    );
  }
}
