import 'package:flutter/material.dart';

import 'm_text.dart';

class MainCategory extends StatelessWidget {
  const MainCategory(this.title, this.text, this.titleColor, this.textColor, {super.key});
  final String title;
  final String text;
  final Color titleColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MText(text: title, fontweight: FontWeight.bold, color: titleColor, size: 20),
            MText(text: text, fontweight: FontWeight.bold, color: textColor, size: 20),
          ],
        ),
      ),
    ])));
  }
}