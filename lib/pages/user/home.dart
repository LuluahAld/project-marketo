import 'package:flutter/material.dart';
import 'package:project_teamd/pages/user/explore_page.dart';
import 'package:project_teamd/pages/user/order_page.dart';
import 'package:project_teamd/pages/user/user_home_page.dart';

import '../../components/bottomNaviagtionBar/bottom_nav_bar.dart';
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
  Widget build(BuildContext context) {
    final pages = [
      const UserHomePage(),
      const ExplorePage(),
      const OrderPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavigation(currentIndex: currentIndex, onTap: _onItemTapped),
    );
  }
}
