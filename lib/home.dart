import 'package:flutter/material.dart';
import 'package:project_teamd/pages/onboarding_pages.dart';

import 'components/bottomNaviagtionBar/bottom_nav_bar.dart';

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
      const OnBoardingPages(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      // const orderPage(),
      // const profilePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavigation(currentIndex: currentIndex, onTap: _onItemTapped),
    );
  }
}
