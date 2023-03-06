import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/appText/main_category.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/product/product_cart.dart';
import 'package:project_teamd/components/textfields/search_bar.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/pages/user/user_product_details.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          color: grey,
          child: Column(
            children: const [
              SizedBox(height: 44),
              Logo(size: 200),
              SizedBox(
                height: 50,
                width: 400,
                child: SearchBar(),
              ),
            ],
          ),
        ),
        StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Column(
                children: [
                  MainCategory(
                    'Popular Seller',
                    'See All',
                    green,
                    lightgreen,
                    1,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProductCard(
                          image: 'images/single-person.png',
                          text: 'Sameera',
                        ),
                        ProductCard(
                          image: 'images/single-person2.png',
                          text: 'Hadi',
                        ),
                        ProductCard(
                          image: 'images/single-person.png',
                          text: 'Luluah',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainCategory(
                    'Recently Viewed',
                    'See All',
                    green,
                    lightgreen,
                    1,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const UserProductDetails()));
                          },
                          child: ProductCard(
                            image: 'images/pic1.png',
                            text: 'T-Shirt',
                          ),
                        ),
                        ProductCard(
                          image: 'images/bag1.jpg',
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
              );
            }),
      ],
    ));
  }
}
