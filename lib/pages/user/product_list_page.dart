import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/product/product_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';

import '../../constants/padding.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        leading: BackButton(
          color: green, // <-- SEE HERE
        ),
        title: Text(
          'Products',
          style: TextStyle(color: green),
        ),
        backgroundColor: grey,
      ),
      body: Padding(
          padding: padding,
          child: Expanded(
            child: GridView.count(shrinkWrap: true, crossAxisCount: 2, childAspectRatio: 0.84, children: [
              for (final pro in product)
                ProsuctCard2(
                  product: Product(
                      id: pro.id,
                      name: pro.name,
                      brand: pro.brand,
                      shopName: pro.shopName,
                      description: pro.description,
                      rating: pro.rating,
                      price: pro.price,
                      category: pro.category,
                      country: pro.country,
                      imageUrl: pro.imageUrl),
                  cardWidth: 185,
                  productImgWidth: 200,
                ),
            ]),
          )),
    );
  }
}
