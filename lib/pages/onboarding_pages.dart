import 'package:flutter/material.dart';

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
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
