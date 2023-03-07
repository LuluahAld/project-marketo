import 'package:flutter/material.dart';
import 'package:project_teamd/components/seller/seller_card.dart';
import 'package:project_teamd/model/seller.dart';

import '../../components/appBar/appbar_local.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarLocal(
          title: 'Sellers',
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
                      seller: const Seller('Sameera', "@Super Sameera", "Sameera@gmail.com", "Shoose Store from london",
                          ['very good,fabuilas'], "2", "imageUrl", 'Jeddah', 'H', [], [], "5.0"),
                    ),
                    SellerCard(
                      seller: const Seller('Hana', "@Super Hana", "Hana@gmail.com", "whatches Store from lebanon",
                          ['very good,fabuilas'], "2", "imageUrl", 'Jeddah', 'H', [], [], "5.0"),
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
                      seller: const Seller('Sameera', "@Super Sameera", "Sameera@gmail.com", "Shoose Store from london",
                          ['very good,fabuilas'], "2", "imageUrl", 'Jeddah', 'S', [], [], "5.0"),
                    ),
                    SellerCard(
                      seller: const Seller('Luluah', "@Super Luluah", "Luluah@gmail.com", "whatches Store from lebanon",
                          ['very good,fabuilas'], "2", "imageUrl", 'Jeddah', 'L', [], [], "5.0"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
