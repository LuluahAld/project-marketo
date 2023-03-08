import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/appText/main_category.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/textfields/search_bar.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/pages/user/cart.dart';
import 'package:project_teamd/pages/user/user_product_details.dart';
import 'package:project_teamd/pages/user/view_seller.dart';

import '../../components/product/product_card.dart';
import '../../components/seller_card_home.dart';
import '../../model/product.dart';
import '../../model/seller.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});
  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<Seller> seller = [];
  StreamSubscription? subscription;
  List<Product> product = [];

  StreamSubscription? subscriptionProduct;

  @override
  void initState() {
    listenToSeller();
    listenToProduct();
    appData.visability();
    super.initState();
  }

  listenToSeller() {
    subscription ??= FirebaseFirestore.instance.collection('seller').snapshots().listen((collection) {
      List<Seller> newList = [];
      for (final doc in collection.docs) {
        final seller = Seller.fromMap(doc.data());
        newList.add(seller);
      }

      seller = newList;
      setState(() {});
    });
  }

  Future<List<Seller>> getSeller() async {
    final collection = await FirebaseFirestore.instance.collection('seller').get();
    List<Seller> newList = [];
    for (final doc in collection.docs) {
      final seller = Seller.fromMap(doc.data());
      newList.add(seller);
      print("new list ");
      print(newList);
    }

    return newList;
  }

  listenToProduct() {
    subscriptionProduct ??= FirebaseFirestore.instance.collection('product').snapshots().listen((collection) {
      List<Product> newList = [];
      for (final doc in collection.docs) {
        final product = Product.fromMap(doc.data());
        newList.add(product);
      }

      product = newList;
      setState(() {});
    });
  }

  Future<List<Product>> getProduct() async {
    final collection = await FirebaseFirestore.instance.collection('product').get();
    List<Product> newList = [];
    for (final doc in collection.docs) {
      final product = Product.fromMap(doc.data());
      newList.add(product);
      print("new list ");
      print(newList);
    }

    return newList;
  }

  @override
  void dispose() {
    listenToSeller();
    listenToProduct();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (appData.cart.isEmpty) {
      appData.cartVisible == false;
      setState(() {});
    } else {
      appData.cartVisible == true;
      setState(() {});
    }
    return Scaffold(
        body: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            color: grey,
            child: Column(
              children: const [
                SizedBox(height: 56),
                Logo(size: 200),
                SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: SearchBar(),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(shrinkWrap: true, padding: const EdgeInsets.all(12), children: [
            MainCategory('Popular Seller', 'See All', green, lightgreen, 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (final sel in seller)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewSeller(
                                    seller: sel,
                                  )));
                    },
                    child: SellerCardHome(
                      seller: sel,
                    ),
                  )
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            MainCategory('Recently Viewed', 'See All', green, lightgreen, 2),
            ListView(padding: EdgeInsets.zero, physics: const BouncingScrollPhysics(), shrinkWrap: true, children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final product in product)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProductDetails(
                                        pro: product,
                                      )));
                        },
                        child: ProsuctCard2(
                          product: product,
                          cardWidth: 200,
                          productImgWidth: 200,
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    padding: padding,
                    decoration: BoxDecoration(
                      color: lightgrey,
                      borderRadius: borderRad,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MText(
                            text: 'Share & get Up to \$100 off',
                            fontweight: FontWeight.bold,
                            color: lightgreen,
                            size: 16),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Give friends a 10% discount up to \$100 off their first Marketo order',
                          style: TextStyle(color: lightgreen),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            MText(text: 'Invite Friends', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                            Icon(
                              Icons.arrow_forward,
                              color: green,
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ])
          ])),
        ]),
        floatingActionButton: Visibility(
          visible: appData.cartVisible,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
            backgroundColor: lightgrey,
            child: Stack(
              children: [
                const SizedBox(
                  height: 70,
                  width: 70,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.shopping_cart,
                    color: green,
                    size: 40,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: pink,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${appData.cart.length}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
