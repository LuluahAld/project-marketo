import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/seller.dart';

import '../../components/appBar/appbar_local.dart';
import '../../components/seller/seller_card.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({super.key});

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  List<Seller> seller = [];
  StreamSubscription? subscription;

  @override
  void initState() {
    listenToSeller();
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

  @override
  void dispose() {
    listenToSeller();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLocal(
        title: 'Sellers',
      ),
      body: Padding(
          padding: padding,
          child: Expanded(
            child: GridView.count(shrinkWrap: true, crossAxisCount: 2, childAspectRatio: 0.84, children: [
              for (final sel in seller)
                SellerCard(
                  seller: Seller(
                      name: sel.name,
                      userName: sel.userName,
                      email: sel.email,
                      about: sel.about,
                      review: sel.review,
                      id: sel.id,
                      logo: sel.logo,
                      location: sel.location,
                      letter: sel.letter,
                      orders: sel.orders,
                      product: sel.product,
                      rating: sel.rating),
                  cardWidth: 200,
                  productImgWidth: 200,
                )
            ]),
          )),
    );
  }
}
