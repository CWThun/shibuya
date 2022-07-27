import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYUserLabel extends StatelessWidget {
  final String label;
  final String value;
  const SBYUserLabel({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ALL_PADDING),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.2, color: Colors.white)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SBYLabel(label: label),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: ALL_PADDING),
              child: Text(value, style: const TextStyle(color: Colors.white, fontSize: TITLE_FONT_SIZE)),
            )
          ],
        ),
      ),
    );
  }
}

class SBYLabel extends StatelessWidget {
  final String label;
  const SBYLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SizedBox(width: 180, child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: LABEL_FONT_SIZE))));
  }
}
