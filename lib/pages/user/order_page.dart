import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_horis_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/pages/user/order_details.dart';

import '../../constants/padding.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  void initState() {
    listenToOrders() {
      FirebaseFirestore.instance.collection('order').snapshots().listen(
        (collection) {
          List<Orders> newList = [];
          for (final doc in collection.docs) {
            final usersN = Orders.fromMap(doc.data());
            newList.add(usersN);
          }
          orders = newList;

          setState(() {});
        },
      );
    }

    listenToOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: grey,
        title: MText(
          text: 'My Order',
          fontweight: FontWeight.bold,
          color: green,
          size: 20,
        ),
      ),
      body: Padding(
        padding: padding,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, i) {
            IconData icon = Icons.pending_actions;
            if (orders[i].orderStatus == 'On the Way') {
              icon = Icons.local_shipping;
            } else if (orders[i].orderStatus == 'Delivered') {
              icon = Icons.done;
            }
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetails(
                        order: orders[i],
                      ),
                    ),
                  );
                },
                child: orderHorisCard(order: orders[i], icon: icon));
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 12,
          ),
        ),
      ),
    );
  }
}
