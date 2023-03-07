import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';

import '../../constants/color_pallete.dart';
import '../../constants/padding.dart';

class LandingOptionCard extends StatelessWidget {
  final String img;
  final String title;
  const LandingOptionCard({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width / 2.6,
          height: MediaQuery.of(context).size.height / 5.5,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: borderRad,
          ),
          child: Column(
            children: [
              Image.asset(
                img,
                width: 100,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              width: MediaQuery.of(context).size.width / 5,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: lightgrey,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              height: MediaQuery.of(context).size.height / 14,
              child: Center(
                child: MText(
                  color: green,
                  text: title,
                  fontweight: null,
                  size: 16,
                ),
              )),
        )
      ],
    );
  }
}
