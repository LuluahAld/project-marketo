import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appBar3.dart';

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
            appBar3(
              choise: 1,
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
