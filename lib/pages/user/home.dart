import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_teamd/pages/user/explore_page.dart';
import 'package:project_teamd/pages/user/order_page.dart';
import 'package:project_teamd/pages/user/user_home_page.dart';

import '../../components/bottomNaviagtionBar/bottom_nav_bar.dart';
import '../../constants/color_pallete.dart';
import '../../model/appData.dart';
import 'cart.dart';
import 'profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var currentIndex = 0;

class _HomeState extends State<Home> {
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    if (appData.cart.isEmpty) {
      visible = false;
      setState(() {});
    } else {
      visible = true;
      setState(() {});
    }
    final pages = [
      const UserHomePage(),
      const ExplorePage(),
      const OrderListPage(),
      const ProfilePage(),
    ];
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: CustomBottomNavigation(currentIndex: currentIndex, onTap: _onItemTapped),
        floatingActionButton: Visibility(
          visible: visible,
          child: FloatingActionButton(
            onPressed: () {
              navigateSecondPage();
            },
            backgroundColor: lightgrey,
            child: Stack(
              children: [
                const SizedBox(
                  height: 70,
                  width: 70,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.shopping_cart,
                    color: green,
                    size: 40,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: pink,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${appData.cart.length}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void refreshData() {}

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => const CartPage());
    Navigator.push(context, route).then(onGoBack);
  }
}
