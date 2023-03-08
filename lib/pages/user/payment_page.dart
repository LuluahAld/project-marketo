import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/buttons/button.dart';
import 'package:project_teamd/components/payment/payment_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/model/user.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Users user =
        const Users(id: 'id', email: 'email', name: 'name', userName: 'userName', location: 'location', orders: []);
    Orders order = Orders(
        id: 'id',
        orderStatus: 'Pending',
        orderDate: DateTime.now().toString(),
        shopName: 'Shopping with Hussin',
        numOfProduct: appData.cart.length.toString(),
        products: appData.cart);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: grey,
          toolbarHeight: 80.0,
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
                button(
                  color: lightgreen,
                  text: 'Pay and Order',
                  NavChoice: 4,
                )
              ],
            )));
  }
}
