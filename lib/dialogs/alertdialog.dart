import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYAlert extends StatelessWidget {
  final String title;
  final String content;
  const SBYAlert({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: TEXT_FONT_SIZE),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 70, child: Text(content, style: const TextStyle(fontSize: BUTTON_FONT_SIZE_SMAL))),
            const Expanded(child: Divider()),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK', style: TextStyle(fontSize: TITLE_FONT_SIZE, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
