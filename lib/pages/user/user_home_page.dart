import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/appText/main_category.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/product/product_cart.dart';
import 'package:project_teamd/components/textfields/search_bar.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/pages/user/view_seller.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    appData.visability();
    super.initState();
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
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
              children: [
                MainCategory('Popular Seller', 'See All', green, lightgreen, 1),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewSeller()));
                        },
                        child: ProductCard(
                          image: 'images/single-person.png',
                          text: 'Sameeraa',
                        ),
                      ),
                      ProductCard(
                        image: 'images/single-person2.png',
                        text: 'Hadi',
                      ),
                      ProductCard(
                        image: 'images/single-person.png',
                        text: 'Hana',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MainCategory('Recently Viewed', 'See All', green, lightgreen, 2),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCard(
                        image: 'images/pic1.png',
                        text: 'T-Shirt',
                      ),
                      ProductCard(
                        image: 'images/bag1.png',
                        text: 'Bag',
                      ),
                      ProductCard(
                        image: 'images/watch1.jpg',
                        text: 'Watch',
                      ),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
