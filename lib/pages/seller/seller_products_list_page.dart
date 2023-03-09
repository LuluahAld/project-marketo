import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';
import 'package:project_teamd/pages/seller/seller_add_product.dart';

import '../../components/product/explore_product_card.dart';

class SellerPListPage extends StatefulWidget {
  const SellerPListPage({super.key});

  @override
  State<SellerPListPage> createState() => _SellerPListPageState();
}

class _SellerPListPageState extends State<SellerPListPage> {
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
        body: Column(children: [
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
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MText(text: "Product", fontweight: FontWeight.bold, color: green, size: 20),
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
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 5, right: 2),
                        child: Column(
                          children: [
                            for (final pro in currentSeller.product)
                              ExploreProductCard(
                                product: pro,
                              ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    ]));
  }
}
