import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/pages/seller/seller_order_details.dart';

import '../../constants/padding.dart';

class SellerOListPage extends StatefulWidget {
  const SellerOListPage({super.key});

  @override
  State<SellerOListPage> createState() => _SellerOListPageState();
}

class _SellerOListPageState extends State<SellerOListPage> {
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: green,
                size: 30,
              ),
              onPressed: () {},
            )
          ]),
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
            } else if (orders[i].orderStatus == 'In Process') {
              icon = Icons.inventory;
            }
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SOrderDetials(
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

class orderHorisCard extends StatelessWidget {
  orderHorisCard({super.key, required this.order, required this.icon});
  Orders order;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 60,
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            padding: padding,
            decoration: BoxDecoration(
              color: lightgrey,
              borderRadius: borderRad,
            ),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(order.id),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(order.orderStatus),
                    ],
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text('${order.total} SAR'),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(order.numOfProduct),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: borderRad,
            ),
            child: Icon(icon)),
      ],
    );
  }
}
