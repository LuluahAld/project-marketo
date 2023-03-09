import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/payment/payment_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/model/order.dart';

class PaymentPage extends StatelessWidget {
  final String? date;
  const PaymentPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    var id = DateTime.now().millisecondsSinceEpoch.remainder(100000000).toString();
    Orders order = Orders(
        id: id,
        orderStatus: 'Pending',
        orderDate: date,
        shopName: appData.cart[0].shopName,
        numOfProduct: appData.cart.length.toString(),
        products: appData.cart,
        total: appData.calculateTotal());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: grey,
        elevation: 0.5,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        title: MText(
          text: "Payment",
          fontweight: FontWeight.bold,
          color: green,
          size: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            const SizedBox(
              height: 32,
            ),
            const paymentCard(),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightgreen,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                final collection = FirebaseFirestore.instance.collection('order');
                collection.doc(order.id).set(order.toMap());
                appData.cart.clear();
                appData.total = 0.0;
                appData.cartVisible = false;
                Navigator.of(context)
                  ..pop()
                  ..pop()
                  ..pop();
              },
              child: const Text(
                'Pay and order',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
