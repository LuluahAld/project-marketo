import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/model/seller.dart';

import '../../constants/color_pallete.dart';

class SellerLocationCard extends StatelessWidget {
  SellerLocationCard({super.key, required this.seller});
  Seller seller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.pin_drop,
              color: green,
              size: 36,
            ),
          ],
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
              child: Text(
                'From',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: lightgreen),
              ),
            ),
            const SizedBox(height: 12),
            MText(text: seller.location, fontweight: FontWeight.bold, color: green, size: 18),
          ],
        )
      ],
    );
  }
}
