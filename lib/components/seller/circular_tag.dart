import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';

class CircularTag extends StatelessWidget {
  const CircularTag(this.text, this.width, this.textColor, this.containerColor, {super.key});
  final String text;
  final double width;
  final Color containerColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            height: MediaQuery.of(context).size.height / 20,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: containerColor,
            ),
            child: Center(
              child: MText(text: text, fontweight: FontWeight.normal, color: textColor, size: 20),
            )),
      ),
    ])));
  }
}
