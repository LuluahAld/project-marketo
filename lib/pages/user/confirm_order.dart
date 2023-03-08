import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/buttons/button.dart';
import 'package:project_teamd/components/order/order_summary_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/user.dart';

import '../../components/order/schedual_time.dart';
import '../../components/order_location.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: grey,
        elevation: 0.5,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        title: MText(
          text: "Confirm Order",
          fontweight: FontWeight.bold,
          color: green,
          size: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            OrderLocationCard(currentUser),
            const SizedBox(
              height: 32,
            ),
            const scheduleTime(),
            const SizedBox(
              height: 32,
            ),
            const OrderSummaryCard('9000', "100", "8000"),
            const SizedBox(
              height: 32,
            ),
            button(
              color: lightgreen,
              text: 'Proceed to payment',
              NavChoice: 3,
            )
          ],
        ),
      ),
    );
  }
}
