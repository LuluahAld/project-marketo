import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/model/product.dart';

import '../../constants/color_pallete.dart';
import '../../constants/padding.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    super.key,
    required this.product,
  });
  Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: borderRad,
          ),
          child: Column(
            children: [
              Image.asset(
                product.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: lightgrey,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
            height: MediaQuery.of(context).size.height / 9.1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(
                      text: product.name,
                      fontweight: FontWeight.w500,
                      color: Colors.black,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    MText(
                      text: product.quantity,
                      fontweight: FontWeight.w500,
                      color: Colors.black,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    MText(
                      text: product.price.toString(),
                      fontweight: FontWeight.w500,
                      color: lightgreen,
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
