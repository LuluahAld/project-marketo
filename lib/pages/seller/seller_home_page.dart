import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/appText/main_category.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/model/product.dart';
import 'package:project_teamd/pages/seller/Sbotton.dart';
import 'package:project_teamd/pages/seller/seller_order_card.dart';
import 'package:project_teamd/pages/seller/seller_product_card.dart';

class SellerHomePage extends StatelessWidget {
  const SellerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: grey,
              child: Column(
                children: const [
                  Logo(size: 200),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MainCategory('My Products', 'See All', green, lightgreen, 1),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SProsuctCard(
                    product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SProsuctCard(
                    product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SProsuctCard(
                    product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: Sbutton(
                    text: ' + Add Product',
                    color: lightgreen,
                    NavChoice: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                MText(text: 'Orders', fontweight: FontWeight.bold, color: green, size: 20),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SOrderCard(
                    order: const Order('id', 'orderStatus', 'orderDate', 'shopName', 'numOfProduct', []),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SOrderCard(
                    order: const Order('id', 'orderStatus', 'orderDate', 'shopName', 'numOfProduct', []),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SOrderCard(
                    order: const Order('id', 'orderStatus', 'orderDate', 'shopName', 'numOfProduct', []),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                MText(text: 'Best Seller', fontweight: FontWeight.bold, color: green, size: 20),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SProsuctCard(
                    product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SProsuctCard(
                    product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SProsuctCard(
                    product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}