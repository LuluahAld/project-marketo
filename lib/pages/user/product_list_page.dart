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
          elevation: 0.5,
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          title: const Text(
            'Products',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: greyLight,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
