import 'package:flutter/material.dart';

import '../../components/logo.dart';
import '../../components/product/explore_product_card.dart';
import '../../components/textfields/search_bar.dart';
import '../../constants/color_pallete.dart';
import '../../model/product.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = const Product("High Brand Bags", "order", 9.0, "jh", "kj", 5.0, '');

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
    ));
  }
}
