import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appbar_local.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_info_card.dart';
import 'package:project_teamd/components/order/order_status.dart';
import 'package:project_teamd/components/order/seller_customer.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/pages/seller/Sbotton.dart';

import '../../constants/color_pallete.dart';

class SOrderDetials extends StatelessWidget {
  SOrderDetials({super.key, required this.order});
  Order order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLocal(title: 'Order #12345'),
      body: ListView(
        padding: padding,
        children: [
          const SizedBox(height: 24),
          orderStatus(
            order: order,
          ),
          const SizedBox(height: 48),
          orderInfoCard(
            order: const Orders(
              id: 'id',
              orderStatus: 'orderStatus',
              orderDate: 'orderDate',
              shopName: 'shopName',
              numOfProduct: 'numOfProduct',
              products: [],
            ),
          ),
          const SizedBox(height: 48),
          const sellerCustomerInfo(),
          const SizedBox(height: 32),
          MText(text: 'Products', fontweight: FontWeight.w500, color: lightgreen, size: 24),
          const SizedBox(height: 16),
          const OrderDetailsCard(),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Sbutton(
            text: 'On the Way',
            color: grey,
            NavChoice: 3,
          ),
          const SizedBox(height: 10),
          Sbutton(
            text: 'Delivered',
            color: pink,
            NavChoice: 3,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Sbutton(
                  text: 'Accept',
                  color: lightgreen,
                  NavChoice: 3,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: Sbutton(
                  text: 'Decline',
                  color: Colors.redAccent,
                  NavChoice: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightgrey,
        borderRadius: borderRad,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Product Title'),
                    SizedBox(height: 4),
                    Text('Category'),
                    SizedBox(height: 4),
                    Text('Description'),
                  ],
                ),
                const SizedBox(width: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Price'),
                    SizedBox(height: 4),
                    Text('Brand'),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                color: grey,
              ),
              child: Image.asset(
                'images/bag1.png',
                width: 120,
              )),
        ],
      ),
    );
  }
}
