import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/appData.dart';

import '../../components/logo.dart';
import '../../components/product/explore_product_card.dart';
import '../../components/textfields/search_bar.dart';
import '../../model/product.dart';
import 'cart.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Product> product = [];
  StreamSubscription? subscription;

  @override
  void initState() {
    listenToProduct();
    appData.visability();

    super.initState();
  }

  listenToProduct() {
    subscription ??= FirebaseFirestore.instance.collection('product').snapshots().listen((collection) {
      List<Product> newList = [];
      for (final doc in collection.docs) {
        final product = Product.fromMap(doc.data());
        newList.add(product);
      }

      product = newList;
      setState(() {});
    });
  }

  Future<List<Product>> getSeller() async {
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
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        for (final pro in product)
                          ExploreProductCard(
                            product: pro,
                          ),
                      ],
                    ))
              ],
            ),
          )
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
