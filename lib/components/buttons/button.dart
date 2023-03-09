import 'package:flutter/material.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/pages/user/confirm_order.dart';

import '../../pages/user/user_home_page.dart';

class button extends StatelessWidget {
  final color;
  final text;
  final NavChoice;
  const button({
    super.key,
    required this.color,
    required this.text,
    required this.NavChoice,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        if (NavChoice == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfirmOrder()));
        } else if (NavChoice == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold()));
        } else if (NavChoice == 3) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
        } else if (NavChoice == 4) {
          appData.cart.clear();

          appData.total = 0.0;
          appData.cartVisible = false;

          Navigator.of(context)
            ..pop()
            ..pop()
            ..pop();
        }
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
