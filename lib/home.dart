import 'package:flutter/material.dart';
import 'package:project_teamd/pages/home_page.dart';
import 'package:project_teamd/pages/order_page.dart';

import 'components/bottomNaviagtionBar/bottom_nav_bar.dart';
import 'pages/profile_page.dart';

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
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const Scaffold(),
      const OrderPage(),

      // const orderPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavigation(currentIndex: currentIndex, onTap: _onItemTapped),
    );
  }
}
