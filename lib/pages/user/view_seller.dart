import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/profile/avatar.dart';
import 'package:project_teamd/components/seller/overall_rate.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';
import 'package:project_teamd/model/user.dart';

import '../../components/location/seller_location_card.dart';
import '../../components/seller/circular_tag.dart';

final PageController _pageController = PageController(initialPage: 0);

class ViewSeller extends StatelessWidget {
  const ViewSeller({super.key});

  @override
  Widget build(BuildContext context) {
    Seller seller = const Seller('Hadi', "@Super Hadi", "hadi@gmail.com", "Bags Store from london",
        ['very good,fabuilas'], "2", '"imageUrl", ', 'alahsaa', 'H', [], [], "5.0");

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.9,
              width: double.infinity,
              decoration: BoxDecoration(color: grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60),
                  Avatar(initial: seller.letter, radius: 55),
                  const SizedBox(height: 10),
                  MText(text: seller.userName, fontweight: FontWeight.w500, color: Colors.black, size: 20),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(color: lightgreen, borderRadius: const BorderRadius.all(Radius.circular(10))),
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightgreen,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              Text(
                                "save",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration:
                            BoxDecoration(color: lightgreen, borderRadius: const BorderRadius.all(Radius.circular(10))),
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightgreen,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.chat_bubble_outline_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Request",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: grey,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            _pageController.jumpToPage(0);
                          },
                          child: Text(
                            "About",
                            style: TextStyle(fontSize: 18, color: lightgreen),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: grey,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            _pageController.jumpToPage(1);
                          },
                          child: Text(
                            "Products",
                            style: TextStyle(fontSize: 18, color: lightgreen),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: grey,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            _pageController.jumpToPage(2);
                          },
                          child: Text(
                            "Reviews",
                            style: TextStyle(fontSize: 19, color: lightgreen),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 230,
                left: 10,
                child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_back,
                      color: green,
                      size: 30,
                    ))),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 1.9, child: const UserSellerPageView())
      ],
    ));
  }
}

class UserSellerPageView extends StatefulWidget {
  const UserSellerPageView({Key? key}) : super(key: key);

  @override
  State<UserSellerPageView> createState() => _UserSellerPageViewState();
}

class _UserSellerPageViewState extends State<UserSellerPageView> {
  // declare and initizlize the page controller
  Seller seller = const Seller('Hadi', "@Super Hadi", "hadi@gmail.com", "Bags Store from london",
      ['very good,fabuilas'], "2", '"imageUrl", ', 'alahsaa', 'H', [], [], "5.0");

  // the index of the current page

  int _activePage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> _pages = [const About(), const Products(), const Reviews()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  // the page view
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _activePage = page;
                          });
                        },
                        itemCount: _pages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _pages[index % _pages.length];
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page One
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Seller seller = const Seller('Hadi', "@Super Hadi", "hadi@gmail.com", "Bags Store from london",
        ['very good,fabuilas'], "2", '"imageUrl", ', 'alahsaa', 'H', [], [], "5.0");
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            MText(
              text: "Seller Information",
              color: green,
              fontweight: FontWeight.normal,
              size: 24,
            )
          ],
        ),
      ),
      const Divider(
        height: 4,
        thickness: 2.0,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            MText(
              text: seller.about,
              color: green,
              fontweight: FontWeight.normal,
              size: 16,
            )
          ],
        ),
      ),
      const Divider(
        height: 4,
        thickness: 2.0,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SellerLocationCard(
              seller: seller,
            )
          ],
        ),
      ),
      const Divider(
        height: 4,
        thickness: 2.0,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            MText(
              text: "Specialization",
              color: green,
              fontweight: FontWeight.normal,
              size: 24,
            )
          ],
        ),
      ),
      //
      Row(
        children: [
          CircularTag('Bags', MediaQuery.of(context).size.width / 4.5, Colors.white, lightgreen),
          CircularTag('Bracelets', MediaQuery.of(context).size.width / 4, Colors.white, lightgreen),
          CircularTag('Tops', MediaQuery.of(context).size.width / 4.5, Colors.white, lightgreen),
        ],
      ),
    ]);
  }
}

// Page Two
class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Seller seller = const Seller('Hadi', "@Super Hadi", "hadi@gmail.com", "Bags Store from london",
        ['very good,fabuilas'], "2", '"imageUrl", ', 'alahsaa', 'H', [], [], "5.0");
    return Column(children: const []);
  }
}

// Page Three
class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Seller seller = const Seller('Hadi', "@Super Hadi", "hadi@gmail.com", "Bags Store from london",
        ['very good,fabuilas'], "2", '"imageUrl", ', 'alahsaa', 'H', [], [], "5.0");
    User user = const User('Hana', 'Super Hana', 'hana@gmail.com', '1', "KSA Dhahran", []);

    return Column(children: [
      OverAllRate(seller.rating, green, FontWeight.w400, 22, lightgreen),
      const Divider(
        height: 4,
        thickness: 2.0,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MText(
              text: "Sorted by",
              color: green,
              fontweight: FontWeight.w400,
              size: 20,
            ),
            Text(
              "Most Relevent",
              style: TextStyle(
                  decoration: TextDecoration.underline, fontSize: 20, fontWeight: FontWeight.w400, color: green),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Avatar(initial: '', radius: 20),
                    const SizedBox(
                      width: 4,
                    ),
                    MText(
                      text: "@${user.userName}",
                      color: green,
                      fontweight: FontWeight.w400,
                      size: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MText(text: "5.0", fontweight: FontWeight.normal, color: lightgreen, size: 20),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    child: MText(text: "User Review", fontweight: FontWeight.normal, color: lightgreen, size: 16),
                  )
                ],
              ),
            )
          ],
        )),
      )
    ]);
  }
}
