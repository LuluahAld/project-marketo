import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/product.dart';

class ExploreProductCard extends StatelessWidget {
  ExploreProductCard({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 10,
          padding: padding,
          decoration: BoxDecoration(
            color: lightgrey,
            borderRadius: borderRad,
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(text: 'Channel Bag', fontweight: FontWeight.bold, color: green, size: 20),
                  const SizedBox(
                    height: 15,
                  ),
                  MText(text: product.id, fontweight: FontWeight.normal, color: green, size: 16),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.2,
              ),
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: borderRad,
            ),
            child: Image.asset(
              'images/logo.png',
            )),
      ],
    );
  }
}
