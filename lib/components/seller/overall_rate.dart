import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';

class OverAllRate extends StatelessWidget {
  const OverAllRate(this.text, this.titleColor, this.fontWeight, this.size, this.textColor, {super.key});
  final String text;
  final FontWeight fontWeight;
  final double size;
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
            MText(text: "Over All Rating", fontweight: fontWeight, color: titleColor, size: size),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 191, 0),
                ),
                const SizedBox(
                  width: 8,
                ),
                MText(text: text, fontweight: FontWeight.normal, color: textColor, size: 20),
              ],
            ),
          ],
        ),
      ),
    ])));
  }
}
