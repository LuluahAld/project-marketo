import 'package:flutter/material.dart';

import '../../components/logo.dart';
import '../../components/product/explore_product_card.dart';
import '../../components/textfields/search_bar.dart';
import '../../constants/color_pallete.dart';
import '../../model/appData.dart';
import '../../model/product.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    appData.visability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (appData.cart.isEmpty) {
    //   appData.cartVisible == false;
    //   setState(() {});
    // } else {
    //   appData.cartVisible == true;
    //   setState(() {});
    // }
    Product product = const Product(
        id: 'id',
        name: 'name',
        brand: 'brand',
        shopName: 'shopName',
        description: 'description',
        rating: 5,
        price: 1000,
        category: 'category',
        country: 'country',
        imageUrl: 'images/bag2.jpg');

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
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) => ExploreProductCard(
                    product: product,
                  ),
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(
                    height: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
