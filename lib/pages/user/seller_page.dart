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
                          name: 'name',
                          userName: 'userName',
                          email: 'email',
                          about: 'about',
                          review: [],
                          id: 'id',
                          logo: 'logo',
                          location: 'location',
                          letter: 'letter',
                          orders: [],
                          product: [],
                          rating: 'rating'),
                    ),
                    SellerCard(
                      seller: const Seller(
                          name: 'name',
                          userName: 'userName',
                          email: 'email',
                          about: 'about',
                          review: [],
                          id: 'id',
                          logo: 'logo',
                          location: 'location',
                          letter: 'letter',
                          orders: [],
                          product: [],
                          rating: 'rating'),
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
                          name: 'name',
                          userName: 'userName',
                          email: 'email',
                          about: 'about',
                          review: [],
                          id: 'id',
                          logo: 'logo',
                          location: 'location',
                          letter: 'letter',
                          orders: [],
                          product: [],
                          rating: 'rating'),
                    ),
                    SellerCard(
                      seller: const Seller(
                          name: 'name',
                          userName: 'userName',
                          email: 'email',
                          about: 'about',
                          review: [],
                          id: 'id',
                          logo: 'logo',
                          location: 'location',
                          letter: 'letter',
                          orders: [],
                          product: [],
                          rating: 'rating'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
