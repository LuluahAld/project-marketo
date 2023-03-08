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
          leading: BackButton(
            color: green, // <-- SEE HERE
          ),
          title: Text(
            seller.userName,
            style: TextStyle(color: green),
          ),
          backgroundColor: greyLight,
          actions: [
            Icon(Icons.search, color: green),
            const SizedBox(
              width: 20,
            ),
            Icon(Icons.favorite_border, color: green),
            const SizedBox(
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
                          id: 'id',
                          name: 'name',
                          brand: 'brand',
                          shopName: 'shopName',
                          description: 'description',
                          rating: 5,
                          price: 1000,
                          category: 'category',
                          country: 'country',
                          imageUrl: 'images/bag2.jpg'),
                      cardWidth: 200,
                      productImgWidth: 200,
                    ),
                    ProsuctCard2(
                      product: const Product(
                          id: 'id',
                          name: 'name',
                          brand: 'brand',
                          shopName: 'shopName',
                          description: 'description',
                          rating: 5,
                          price: 1000,
                          category: 'category',
                          country: 'country',
                          imageUrl: 'images/bag2.jpg'),
                      cardWidth: 200,
                      productImgWidth: 200,
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
                          id: 'id',
                          name: 'name',
                          brand: 'brand',
                          shopName: 'shopName',
                          description: 'description',
                          rating: 5,
                          price: 1000,
                          category: 'category',
                          country: 'country',
                          imageUrl: 'images/bag2.jpg'),
                      cardWidth: 200,
                      productImgWidth: 200,
                    ),
                    ProsuctCard2(
                      product: const Product(
                          id: 'id',
                          name: 'name',
                          brand: 'brand',
                          shopName: 'shopName',
                          description: 'description',
                          rating: 5,
                          price: 1000,
                          category: 'category',
                          country: 'country',
                          imageUrl: 'images/bag2.jpg'),
                      cardWidth: 200,
                      productImgWidth: 200,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
