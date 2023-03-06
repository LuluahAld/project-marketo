import 'package:flutter/material.dart';
import 'package:project_teamd/components/seller/seller_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          title: const Text(
            'Seller',
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
                    SellerCard(
                      seller: const Seller(
                          'Sameera', 'userName', 'email', 'id', 'Jeddah', 'images/single-person.png', [], [], '5'),
                    ),
                    SellerCard(
                      seller: const Seller(
                          'Hana', 'userName', 'email', 'id', 'Riyadh', 'images/single-person.png', [], [], '5'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SellerCard(
                      seller: const Seller(
                          'Hadi', 'userName', 'email', 'id', 'Jeddah', 'images/single-person2.png', [], [], '5'),
                    ),
                    SellerCard(
                      seller: const Seller(
                          'Luluah', 'userName', 'email', 'id', 'Riyadh', 'images/single-person.png', [], [], '5'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
