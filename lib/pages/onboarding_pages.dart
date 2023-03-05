import 'package:flutter/material.dart';
import 'package:project_teamd/constants.dart';

import '../components/button.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            button(
              color: lightgreen,
              text: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
