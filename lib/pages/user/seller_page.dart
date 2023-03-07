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
                      seller: const Seller(
                          name: 'Sameera',
                          userName: "@SuperSameera",
                          email: "sameera@gmail.com",
                          about: "Bags Store from london",
                          review: ['very good,fabuilas'],
                          id: "2",
                          logo: "images",
                          location: 'Jedddah',
                          letter: 'S',
                          orders: [],
                          product: [],
                          rating: "5.0"),
                      cardWidth: 200,
                      productImgWidth: 200,
                    ),
                    SellerCard(
                      seller: const Seller(
                          name: 'Sameera',
                          userName: "@SuperSameera",
                          email: "sameera@gmail.com",
                          about: "Bags Store from london",
                          review: ['very good,fabuilas'],
                          id: "2",
                          logo: "images",
                          location: 'Jedddah',
                          letter: 'S',
                          orders: [],
                          product: [],
                          rating: "5.0"),
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
                    SellerCard(
                      seller: const Seller(
                          name: 'Sameera',
                          userName: "@SuperSameera",
                          email: "sameera@gmail.com",
                          about: "Bags Store from london",
                          review: ['very good,fabuilas'],
                          id: "2",
                          logo: "images",
                          location: 'Jedddah',
                          letter: 'S',
                          orders: [],
                          product: [],
                          rating: "5.0"),
                      cardWidth: 200,
                      productImgWidth: 200,
                    ),
                    SellerCard(
                      seller: const Seller(
                          name: 'Sameera',
                          userName: "@SuperSameera",
                          email: "sameera@gmail.com",
                          about: "Bags Store from london",
                          review: ['very good,fabuilas'],
                          id: "2",
                          logo: "images",
                          location: 'Jedddah',
                          letter: 'S',
                          orders: [],
                          product: [],
                          rating: "5.0"),
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
