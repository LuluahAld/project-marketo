import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/profile/avatar.dart';
import 'package:project_teamd/components/seller/overall_rate.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';
import 'package:project_teamd/model/user.dart';

import '../../components/location/seller_location_card.dart';
import '../../components/product/product_card.dart';
import '../../components/seller/circular_tag.dart';
import '../../model/product.dart';

final PageController _pageController = PageController(initialPage: 0);

class ViewSeller extends StatefulWidget {
  ViewSeller({super.key, required this.seller});
  Seller seller;
  @override
  State<ViewSeller> createState() => _ViewSellerState();
}

class _ViewSellerState extends State<ViewSeller> {
  List<bool> isSelect = [false, false, false];
  File? imageFile;

  @override
  void initState() {
    isSelect = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Seller seller = widget.seller;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(color: grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 90),
                    CircleAvatar(
                      backgroundImage: NetworkImage(seller.logo),
                      backgroundColor: Colors.white,
                      radius: 55,
                    ),
                    // Avatar(initial: seller.letter, radius: 55),
                    const SizedBox(height: 10),
                    MText(text: seller.userName, fontweight: FontWeight.w500, color: Colors.black, size: 20),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: lightgreen, borderRadius: const BorderRadius.all(Radius.circular(10))),
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightgreen,
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Save",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: lightgreen, borderRadius: const BorderRadius.all(Radius.circular(10))),
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightgreen,
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return SizedBox(
                                    height: 450,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 40),
                                          Text(
                                            'Description*',
                                            style: TextStyle(fontSize: 20, color: green, fontWeight: FontWeight.w500),
                                          ),
                                          const TextField(),
                                          const SizedBox(height: 20),
                                          Text(
                                            'Suggested Price',
                                            style: TextStyle(fontSize: 20, color: green, fontWeight: FontWeight.w500),
                                          ),
                                          const TextField(),
                                          const SizedBox(height: 20),
                                          Text(
                                            '+ Choose Image',
                                            style: TextStyle(color: green, fontSize: 20, fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 20),
                                          Container(
                                            child: imageFile == null
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(backgroundColor: lightgreen),
                                                          onPressed: () {
                                                            _getFromGallery();
                                                          },
                                                          child: const Text("PICK FROM GALLERY"),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(backgroundColor: lightgreen),
                                                          onPressed: () {
                                                            _getFromCamera();
                                                          },
                                                          child: const Text("PICK FROM CAMERA"),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Image.asset(
                                                    imageFile!.path,
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                  ),
                                          ),
                                          const SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: lightgreen,
                                                minimumSize: const Size.fromHeight(50),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                imageFile = null;
                                              },
                                              child: const Text(
                                                'Request',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.chat_bubble_outline_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
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
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            isSelect.setAll(0, [false, false, false]);
                            isSelect[0] = !isSelect[0];
                            setState(() {});
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                          },
                          child: Column(
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                  color: isSelect[0] ? green : lightgreen,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              if (isSelect[0])
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3.3,
                                  child: Divider(
                                    height: 0,
                                    thickness: 3,
                                    color: green,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            isSelect.setAll(0, [false, false, false]);
                            isSelect[1] = !isSelect[1];
                            setState(() {});
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                          },
                          child: Column(
                            children: [
                              Text(
                                'Products',
                                style: TextStyle(
                                  color: isSelect[1] ? green : lightgreen,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              if (isSelect[1])
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3.3,
                                  child: Divider(
                                    height: 0,
                                    thickness: 3,
                                    color: green,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            isSelect.setAll(0, [false, false, false]);
                            isSelect[2] = !isSelect[2];
                            setState(() {});
                            _pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
                          },
                          child: Column(
                            children: [
                              Text(
                                'Reviews',
                                style: TextStyle(
                                  color: isSelect[2] ? green : lightgreen,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              if (isSelect[2])
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3.3,
                                  child: Divider(
                                    height: 0,
                                    thickness: 3,
                                    color: green,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: green,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 1.9, child: const UserSellerPageView())
        ],
      ),
    );
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(
        () {
          imageFile = File(pickedFile.path);
        },
      );
    }
  }
}

class UserSellerPageView extends StatefulWidget {
  const UserSellerPageView({Key? key}) : super(key: key);

  @override
  State<UserSellerPageView> createState() => _UserSellerPageViewState();
}

class _UserSellerPageViewState extends State<UserSellerPageView> {
  // declare and initizlize the page controller
  Seller seller = const Seller(
      name: 'Sameera',
      userName: "@SuperSameera",
      email: "sameera@gmail.com",
      about: "Bags Store from london",
      review: ['very good,fabuilas'],
      id: "2",
      logo: "images",
      location: 'Jedddah',
      letter: 'S',
      orders: [],
      product: [],
      rating: 5.0);

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
    Seller seller = const Seller(
        name: 'Sameera',
        userName: "@SuperSameera",
        email: "sameera@gmail.com",
        about: "Bags Store from london",
        review: ['very good,fabuilas'],
        id: "2",
        logo: "images",
        location: 'Jedddah',
        letter: 'S',
        orders: [],
        product: [],
        rating: 5.0);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(children: [
        Row(
          children: [
            MText(
              text: "Seller Information",
              color: green,
              fontweight: FontWeight.normal,
              size: 24,
            )
          ],
        ),
        const Divider(
          height: 40,
          thickness: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            seller.about,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: green,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ),
        const Divider(
          height: 40,
          thickness: 1.5,
        ),
        Row(
          children: [
            SellerLocationCard(
              seller: seller,
            )
          ],
        ),
        const Divider(
          height: 40,
          thickness: 1.5,
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
            CircularTag('Bags', Colors.white, lightgreen),
            CircularTag('Bracelets', Colors.white, lightgreen),
            CircularTag('Tops', Colors.white, lightgreen),
          ],
        ),
      ]),
    );
  }
}

// Page Two
class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Seller seller = const Seller(
        name: 'Sameera',
        userName: "@SuperSameera",
        email: "sameera@gmail.com",
        about: "Bags Store from london",
        review: ['very good,fabuilas'],
        id: "2",
        logo: "images",
        location: 'Jedddah',
        letter: 'S',
        orders: [],
        product: [],
        rating: 5.0);
    return Column(
      children: [
        ListView(padding: EdgeInsets.zero, physics: const BouncingScrollPhysics(), shrinkWrap: true, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProsuctCard2(
                product: const Product(
                  id: 'id',
                  name: 'name',
                  brand: 'brand',
                  shopName: 'shopName',
                  description: 'description',
                  rating: 5,
                  price: 1000,
                  category: 'category',
                  country: 'country',
                  imageUrl: 'images/bag2.jpg',
                ),
                cardWidth: MediaQuery.of(context).size.width / 2.3,
                productImgWidth: MediaQuery.of(context).size.width / 2.2,
              ),
              ProsuctCard2(
                product: const Product(
                  id: 'id',
                  name: 'name',
                  brand: 'brand',
                  shopName: 'shopName',
                  description: 'description',
                  rating: 5,
                  price: 1000,
                  category: 'category',
                  country: 'country',
                  imageUrl: 'images/bag1.png',
                ),
                cardWidth: MediaQuery.of(context).size.width / 2.3,
                productImgWidth: MediaQuery.of(context).size.width / 2.2,
              ),
            ],
          )
        ]),
      ],
    );
  }
}

// Page Three
class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Seller seller = const Seller(
        name: 'Sameera',
        userName: "@SuperSameera",
        email: "sameera@gmail.com",
        about: "Bags Store from london",
        review: ['very good,fabuilas'],
        id: "2",
        logo: "images",
        location: 'Jedddah',
        letter: 'S',
        orders: [],
        product: [],
        rating: 5.0);
    Users user = const Users(
        name: 'Hana', userName: 'Super Hana', email: 'hana@gmail.com', id: '1', location: "KSA Dhahran", orders: []);

    return Column(children: [
      OverAllRate(seller.rating.toString(), green, FontWeight.w400, 22, lightgreen),
      const Divider(
        height: 40,
        thickness: 1.5,
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
      const SizedBox(height: 20),
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
