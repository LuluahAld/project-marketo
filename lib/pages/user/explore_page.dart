import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';

import '../../components/logo.dart';
import '../../components/product/explore_product_card.dart';
import '../../components/textfields/search_bar.dart';
import '../../model/product.dart';

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
    // Product product = const Product(
    //     id: 'id',
    //     name: 'name',
    //     brand: 'brand',
    //     shopName: 'shopName',
    //     description: 'description',
    //     rating: 5,
    //     price: 1000,
    //     category: 'category',
    //     country: 'country',
    //     imageUrl: 'images/bag2.jpg');

    return Scaffold(
        body: Column(
      children: [
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
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
