import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/model/product.dart';

import '../../constants/color_pallete.dart';
import '../../constants/padding.dart';

class OrderCard extends StatelessWidget {
  final Function ondelete;
  OrderCard({
    super.key,
    required this.product,
    required this.ondelete,
  });
  Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: borderRad,
          ),
          child: Column(
            children: [
              Image.network(
                product.imageUrl,
                fit: BoxFit.fitWidth,
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
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        )),
                    const SizedBox(
                      height: 6,
                    ),
                    MText(
                      text: product.country,
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
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: InkWell(
            onTap: () {
              appData.cart.remove(product);
              ondelete();
            },
            child: const Icon(
              Icons.remove_circle,
              color: Colors.redAccent,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
