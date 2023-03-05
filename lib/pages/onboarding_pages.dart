import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appBar.dart';

import '../constants/padding.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          children: const [
            appBar(
              text: 'Product',
              choise: 0,
              icon1: Icons.search,
              icon2: Icons.favorite,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
