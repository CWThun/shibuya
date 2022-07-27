import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SBYItemElement extends StatelessWidget {
  final List<Widget> children;
  const SBYItemElement({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ALL_PADDING),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.5, color: Colors.grey)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
