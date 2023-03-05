import 'package:flutter/material.dart';

import '../constants/color_pallete.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, this.currentIndex = 0, required this.onTap});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 30, color: green),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: green,
            size: 30,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: green,
            size: 30,
          ),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_pin,
            size: 30,
            color: green,
          ),
          label: ' ',
        ),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
      fixedColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}
