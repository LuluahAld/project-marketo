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
                    ProsuctCard2(
                      product: const Product(
                        "1",
                        "High Brand Bags channel",
                        9.0,
                        "channel",
                        "limited edition line",
                        "Hadi",
                        '5',
                        "Bags",
                        5.0,
                        'images/bag2.jpg',
                      ),
                    ),
                    ProsuctCard2(
                      product: const Product(
                        "1",
                        "High Brand Bags channel",
                        9.0,
                        "channel",
                        "limited edition line",
                        "Hadi",
                        '5',
                        "Bags",
                        5.0,
                        'images/bag2.jpg',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProsuctCard2(
                      product: const Product(
                        "1",
                        "High Brand Bags channel",
                        9.0,
                        "channel",
                        "limited edition line",
                        "Hadi",
                        '5',
                        "Bags",
                        5.0,
                        'images/bag2.jpg',
                      ),
                    ),
                    ProsuctCard2(
                      product: const Product(
                        "1",
                        "High Brand Bags channel",
                        9.0,
                        "channel",
                        "limited edition line",
                        "Hadi",
                        '5',
                        "Bags",
                        5.0,
                        'images/bag2.jpg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
