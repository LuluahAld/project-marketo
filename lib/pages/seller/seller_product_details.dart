import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/buttons/button.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/product.dart';

class SellerProductDetails extends StatelessWidget {
  SellerProductDetails({
    super.key,
    required this.product,
  });

  Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: padding,
                      child: Image.asset(product.imageUrl),
                    ),
                    Positioned(
                        left: 30,
                        top: 30,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: MText(text: product.name, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: MText(
                              text: '${product.price} SAR', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child:
                              MText(text: product.category, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: MText(text: product.brand, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: MText(text: 'Description', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
