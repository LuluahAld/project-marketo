import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/model/product.dart';
import 'package:project_teamd/model/seller.dart';

class SLoginPage extends StatefulWidget {
  const SLoginPage({super.key}) : super();

  @override
  _SLoginPage createState() => _SLoginPage();
}

bool isSeller = false;

class _SLoginPage extends State<SLoginPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: beige,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 120),
                  const Logo(size: 290),
                  const SizedBox(height: 52),
                  Text(
                    'Business',
                    style: TextStyle(color: pink, fontSize: 36, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Create your business account ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _buildMenuBar(context),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (i == 0) {
                          setState(() {
                            right = beige;
                            left = green;
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = green;
                            left = beige;
                          });
                        }
                      },
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: const Login(),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: const Register(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: lightgreen,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Login',
                  style: TextStyle(color: left, fontSize: 16.0),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'Register',
                  style: TextStyle(color: right, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class BubbleIndicatorPainter extends CustomPainter {
  BubbleIndicatorPainter(
      {this.dxTarget = 125.0, this.dxEntry = 25.0, this.radius = 21.0, this.dy = 25.0, required this.pageController})
      : super(repaint: pageController) {
    painter = Paint()
      ..color = beige
      ..style = PaintingStyle.fill;
  }

  late Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  @override
  void paint(Canvas canvas, Size size) {
    final ScrollPosition pos = pageController.position;
    final double fullExtent = pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension;

    final double pageOffset = pos.extentBefore / fullExtent;

    final bool left2right = dxEntry < dxTarget;
    final Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    final Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    final Path path = Path();
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, CustomTheme.loginGradientStart, 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(BubbleIndicatorPainter oldDelegate) => true;
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool isVisible = false;
  bool isLoading = false;
  bool isLoggedIn = false;
  @override
  void initState() {
    listenToSellers() {
      FirebaseFirestore.instance.collection('seller').snapshots().listen(
        (collection) {
          List<Seller> newList = [];
          for (final doc in collection.docs) {
            final usersN = Seller.fromMap(doc.data());
            newList.add(usersN);
          }
          sellers = newList;
          print(sellers.length);
          print('up');
          setState(() {});
        },
      );
    }

    listenToSellers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Stack(
            children: [
              const SizedBox(
                height: 400,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: borderRad,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                          hintText: 'Email',
                          hintStyle: const TextStyle(fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5, color: green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: password,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isVisible = !isVisible;
                                  setState(() {});
                                },
                                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility)),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                            hintText: 'Password',
                            hintStyle: const TextStyle(fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: green),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5, color: green),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading) ...[
                Positioned(
                  bottom: 20,
                  left: 170,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: lightgreen,
                    ),
                  ),
                ),
              ],
              Positioned(
                bottom: 76,
                left: 48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 100),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        FirebaseAuth.instance.authStateChanges().listen((user) {
                          isLoggedIn = user != null;
                          setState(() {});

                          if (isLoggedIn) {
                            setState(() {
                              isLoading = false;
                              isSeller = true;
                            });
                            print(sellers.length);
                            print('down');
                            for (var i = 0; i < sellers.length; i++) {
                              if (sellers[i].id == user?.uid) {
                                currentSeller = sellers[i];

                                setState(() {});
                              }
                            }
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                          }
                        });
                      } on FirebaseAuthException catch (e) {
                        print(e);
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightgreen,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Stack(
            children: [
              const SizedBox(
                height: 400,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: borderRad,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                          hintText: 'Email',
                          hintStyle: const TextStyle(fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5, color: green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                            hintText: 'Username',
                            hintStyle: const TextStyle(fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: green),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5, color: green),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: password,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isVisible = !isVisible;
                                  setState(() {});
                                },
                                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility)),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                            hintText: 'Password',
                            hintStyle: const TextStyle(fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: green),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5, color: green),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading) ...[
                Positioned(
                  bottom: 20,
                  left: 170,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: lightgreen,
                    ),
                  ),
                ),
              ],
              Positioned(
                bottom: 76,
                left: 48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 100),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          setState(() {
                            isLoading = false;
                          });
                          String uid = user.uid; // <-- User ID
                          String? email = user.email;
                          if (email == 'hussin@gmail.com') {
                            currentSeller = Seller(
                                name: 'Shopping with Hussin',
                                userName: 'Hussin',
                                email: email,
                                about: 'First Male Shopper In KSA',
                                review: ['Good', 'Great'],
                                id: uid,
                                logo: 'https://cdn.salla.sa/PlpaB/OQVkSOW9fZN9siCG0QuYj8aqVUYRUL4t36zWUJiS.jpg',
                                location: 'Riyadh, Saudi Arabia',
                                letter: '',
                                orders: [
                                  const Orders(
                                    id: 'order1',
                                    orderStatus: 'In Process',
                                    orderDate: '15 Jan 2023',
                                    shopName: 'Shopping with Hussin',
                                    numOfProduct: '1',
                                    products: [
                                      Product(
                                          id: 'bag4',
                                          name: 'Loubishore Bag in Braided Palm Leaves & Leather',
                                          price: 2600,
                                          brand: 'CHRISTIAN LOUBOUTIN',
                                          description:
                                              'The Loubishore by Christian Louboutin is the perfect bag to set off your summery edits. Its classic basket-inspired silhouette is handwoven from palm leaves with logo-embossed leather patches adding a signature touch. The design is completed with the house\'s red trims on the inside of the top handles.',
                                          shopName: 'Shopping with Hussin',
                                          category: 'Bags',
                                          country: 'France',
                                          rating: 4.5,
                                          imageUrl:
                                              'https://ounass-prod2.atgcdn.ae/small_light(p=zoom,of=webp,q=65)/pub/media/catalog/product//2/1/214518473_natural_in.jpg?1620725566.9286')
                                    ],
                                  )
                                ],
                                product: [
                                  const Product(
                                      id: 'bag4',
                                      name: 'Loubishore Bag in Braided Palm Leaves & Leather',
                                      price: 2600,
                                      brand: 'CHRISTIAN LOUBOUTIN',
                                      description:
                                          'The Loubishore by Christian Louboutin is the perfect bag to set off your summery edits. Its classic basket-inspired silhouette is handwoven from palm leaves with logo-embossed leather patches adding a signature touch. The design is completed with the house\'s red trims on the inside of the top handles.',
                                      shopName: 'Shopping with Hussin',
                                      category: 'Bags',
                                      country: 'France',
                                      rating: 4.5,
                                      imageUrl:
                                          'https://ounass-prod2.atgcdn.ae/small_light(p=zoom,of=webp,q=65)/pub/media/catalog/product//2/1/214518473_natural_in.jpg?1620725566.9286')
                                ],
                                rating: '5.0');
                          } else {
                            currentSeller = Seller(
                                name: '',
                                userName: username.text,
                                email: email,
                                about: '',
                                review: [],
                                id: uid,
                                logo: '',
                                location: '',
                                letter: '',
                                orders: [],
                                product: [],
                                rating: '4.8');
                          }
                          setState(() {});

                          final collection = FirebaseFirestore.instance.collection('seller');
                          collection.doc(currentSeller.id).set(currentSeller.toMap());
                        }
                      } on FirebaseAuthException {}
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          padding: const EdgeInsets.all(12),
                          dismissDirection: DismissDirection.none,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(30),
                          backgroundColor: lightgreen,
                          content: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Account Successfully Registered. Please login.',
                            ),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightgreen,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(37, 10, 37, 10),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
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
