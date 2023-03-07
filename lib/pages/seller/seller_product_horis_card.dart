import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/product.dart';

class SProductHorisCard extends StatelessWidget {
  SProductHorisCard({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 9.5,
          padding: const EdgeInsets.all(12),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.name),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(product.category),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(product.rating.toString()),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 180),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('${product.price} SAR'),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(product.brand),
                ],
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
          child: Image.asset(product.imageUrl),
        )
      ],
    );
  }
}
