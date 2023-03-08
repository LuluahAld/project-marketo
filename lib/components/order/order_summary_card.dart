import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/model/appData.dart';

import '../../constants/color_pallete.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard(this.total, this.deliverFee, this.subTotal, {super.key});
  final String total;
  final String deliverFee;
  final String subTotal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            child: Column(children: [
      Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgrey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    MText(text: 'Order Summary', fontweight: FontWeight.bold, color: green, size: 20),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MText(text: 'Total', fontweight: FontWeight.normal, color: green, size: 20),
                      MText(text: '${appData.total + 100} SAR', fontweight: FontWeight.normal, color: green, size: 18),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MText(text: 'Delivery Fee', fontweight: FontWeight.normal, color: green, size: 20),
                      MText(text: '${100} SAR', fontweight: FontWeight.normal, color: green, size: 18),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MText(text: 'Subtotal', fontweight: FontWeight.normal, color: green, size: 20),
                    MText(text: '${appData.total} SAR', fontweight: FontWeight.normal, color: green, size: 18),
                  ],
                ),
              ],
            ),
          )),
    ])));
  }
}
