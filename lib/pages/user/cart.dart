import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/buttons/button.dart';
import 'package:project_teamd/components/order/order_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';

import '../../constants/padding.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = const Product(
        id: 'id',
        name: 'name',
        brand: 'brand',
        shopName: 'shopName',
        description: 'description',
        rating: 5,
        price: 1000,
        category: 'category',
        country: 'country',
        imageUrl: 'images/bag2.jpg');

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: green),
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: grey,
        title: MText(
          text: "My Cart",
          fontweight: FontWeight.bold,
          color: green,
          size: 20,
        ),
      ),
      body: Padding(
        padding: padding,
        child: ListView(
          children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) => OrderCard(product: product),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 12,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: 'Total', fontweight: FontWeight.normal, color: green, size: 20),
                  MText(text: '9000 SAR', fontweight: FontWeight.normal, color: green, size: 18),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            button(color: lightgreen, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
