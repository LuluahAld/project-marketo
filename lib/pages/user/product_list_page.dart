import 'package:flutter/material.dart';
import 'package:project_teamd/components/product/product_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          title: const Text(
            'Products',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: greyLight,
          actions: const [
            Icon(Icons.search, color: Colors.black),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.favorite_border, color: Colors.black),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProsuctCard2(
                        product: const Product('id', 'T-Shirt', 100, 'Gucci', 'T-Shirts', 4.5, 'images/pic1.png')),
                    ProsuctCard2(
                        product: const Product('id', 'T-Shirt', 100, 'Gucci', 'T-Shirts', 4.5, 'images/pic1.png')),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProsuctCard2(
                        product: const Product('id', 'T-Shirt', 100, 'Gucci', 'T-Shirts', 4.5, 'images/pic1.png')),
                    ProsuctCard2(
                        product: const Product('id', 'T-Shirt', 100, 'Gucci', 'T-Shirts', 4.5, 'images/pic1.png')),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
