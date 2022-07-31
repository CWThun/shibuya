// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYUserLabel extends StatelessWidget {
  final String label;
  final String value;
  double width;
  SBYUserLabel({Key? key, required this.label, required this.value, this.width = 180}) : super(key: key);

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
            SBYLabel(label: label, width: width),
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
  double width;
  SBYLabel({Key? key, required this.label, this.width = 180}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SizedBox(width: width, child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: LABEL_FONT_SIZE))));
  }
}
