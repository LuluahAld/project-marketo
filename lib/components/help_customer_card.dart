import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';

class HelpCard extends StatelessWidget {
  HelpCard(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.iconSize});

  final IconData icon;
  String text1;
  String text2;
  String text3;
  double iconSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 12,
          padding: padding,
          decoration: BoxDecoration(
            color: lightgrey,
            borderRadius: borderRad,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MText(
                      text: text1,
                      fontweight: FontWeight.bold,
                      color: green,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    MText(
                      text: text2,
                      fontweight: FontWeight.normal,
                      color: green,
                      size: 14,
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      text3,
                      style: TextStyle(fontSize: 14, decoration: TextDecoration.underline, color: green),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 12,
            decoration: BoxDecoration(
              color: pink.withOpacity(0.3),
              borderRadius: borderRad,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: green.withOpacity(0.7),
            )),
      ],
    );
  }
}
