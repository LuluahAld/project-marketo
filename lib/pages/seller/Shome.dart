import 'package:flutter/material.dart';
import 'package:project_teamd/pages/seller/SNav_Bar.dart';
import 'package:project_teamd/pages/seller/seller_home_page.dart';
import 'package:project_teamd/pages/seller/seller_order_list_page.dart';
import 'package:project_teamd/pages/seller/seller_products_list_page.dart';
import 'package:project_teamd/pages/seller/seller_profile_page.dart';

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHome();
}

var currentIndex = 0;

class _SHome extends State<SHome> {
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

  @override
  Widget build(BuildContext context) {
    final pages = [
      const SellerHomePage(),
      const SellerPListPage(),
      const SellerOListPage(),
      const SProfilePage(),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SCustomBottomNavigation(currentIndex: currentIndex, onTap: _onItemTapped),
    );
  }
}
