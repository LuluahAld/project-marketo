import 'package:flutter/material.dart';

import '../../constants/color_pallete.dart';

class SCustomBottomNavigation extends StatelessWidget {
  const SCustomBottomNavigation({super.key, this.currentIndex = 0, required this.onTap});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.discount,
            size: 30,
          ),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pending_actions_outlined,
            size: 30,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 30,
          ),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: green,
      backgroundColor: Colors.white,
      unselectedItemColor: lightgreen,
      selectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
    );
  }
}
