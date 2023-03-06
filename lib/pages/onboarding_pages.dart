import 'package:flutter/material.dart';
import 'package:project_teamd/components/order/schedual_time.dart';
import 'package:project_teamd/components/payment/payment_card.dart';

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
            paymentCard(),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
