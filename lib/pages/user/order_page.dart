import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_horis_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/pages/user/order_details.dart';

import '../../constants/padding.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Order order = const Order(
      id: 'id',
      orderStatus: 'orderStatus',
      orderDate: 'orderDate',
      shopName: 'shopName',
      numOfProduct: 'numOfProduct',
      products: [],
    );
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
              onPressed: () {
                // do something
              },
            )
          ]),
      body: Padding(
        padding: padding,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetials()));
              },
              child: orderHorisCard(order: order, icon: Icons.done)),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 12,
          ),
        ),
      ),
    );
  }
}
