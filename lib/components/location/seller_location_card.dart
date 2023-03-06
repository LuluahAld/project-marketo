import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';

import '../../constants/color_pallete.dart';

class SellerLocationCard extends StatelessWidget {
  const SellerLocationCard(this.country, this.city, {super.key});
  final String country;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.pin_drop,
          color: green,
          size: 36,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: lightgreen),
                  ),
                ],
              ),
            ),
            MText(text: "$country  $city", fontweight: FontWeight.bold, color: green, size: 20),
          ],
        )
      ],
    );
  }
}
