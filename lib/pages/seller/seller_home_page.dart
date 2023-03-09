import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/pages/seller/seller_add_product.dart';
import 'package:project_teamd/pages/seller/seller_product_card.dart';

import '../../model/seller.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  void initState() {
    listenToSellers() {
      FirebaseFirestore.instance.collection('seller').snapshots().listen(
        (collection) {
          Seller seller = const Seller(
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
              rating: 4);
          for (final doc in collection.docs) {
            if (doc.id == currentSeller.id) {
              print('hi');
              seller = Seller.fromMap(doc.data());
            }
          }
          currentSeller = seller;

          setState(() {});
        },
      );
    }

    listenToSellers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          color: grey,
          child: Column(
            children: const [
              SizedBox(height: 56),
              Logo(size: 230),
              SizedBox(height: 8),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(12),
            children: [
              //MainCategory('Recently Added ', 'See All', green, lightgreen, 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: "Recently Added", fontweight: FontWeight.bold, color: green, size: 20),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightgreen,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProduct()));
                      },
                      child: const Text(
                        '+ Add Product',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var product in currentSeller.product)
                      SProductCard(
                        product: product,
                        cardWidth: 200,
                        productImgWidth: 200,
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 40,
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
                    for (var product in currentSeller.product)
                      SProductCard(
                        product: product,
                        cardWidth: 200,
                        productImgWidth: 200,
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
