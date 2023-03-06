import 'package:flutter/material.dart';
import 'package:project_teamd/components/order/seller_customer.dart';

import '../constants/padding.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          children: [
            sellerCustomerInfo(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
