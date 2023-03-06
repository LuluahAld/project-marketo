import 'package:flutter/material.dart';
import 'package:project_teamd/components/product/product_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';
import 'package:project_teamd/model/seller.dart';

class SellerProductListPage extends StatelessWidget {
  SellerProductListPage({super.key, required this.seller});
  Seller seller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          title: Text(
            seller.userName,
            style: const TextStyle(color: Colors.black),
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
                    ProsuctCard2(product: const Product('id', 'Bag', 100, 'Gucci', 'Bags', 4.5, 'images/bag1.jpg')),
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
                        product: const Product('id', 'Watch', 100, 'Gucci', 'Watches', 4.5, 'images/watch1.jpg')),
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
