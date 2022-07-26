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
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Text(content)),
            const Expanded(child: Divider()),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: TITLE_FONT_SIZE, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
