import 'package:flutter/material.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';

import '../components/landing/landing_option_card.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 140),
            const Center(
              child: Logo(size: 300),
            ),
            const SizedBox(height: 220),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 24),
              child: Text(
                'Personal Shopper Services.',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 40,
                  color: beige,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const LandingOptionCard(
                    img: 'images/landing/user.png',
                    title: 'Find a Product',
                  ),
                ),
                const SizedBox(width: 40),
                InkWell(
                  onTap: () {},
                  child: const LandingOptionCard(
                    img: 'images/landing/seller.png',
                    title: 'Become a Seller',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
