import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appbar_local.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_info_card.dart';
import 'package:project_teamd/components/order/order_status.dart';
import 'package:project_teamd/components/order/seller_customer.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';

import '../../constants/color_pallete.dart';

class OrderDetials extends StatelessWidget {
  const OrderDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLocal(title: 'Order #12345'),
      body: ListView(
        padding: padding,
        children: [
          const SizedBox(height: 24),
          const orderStatus(),
          const SizedBox(height: 48),
          orderInfoCard(
            order: const Order('0', '', '', '', '', []),
          ),
          const SizedBox(height: 48),
          const sellerCustomerInfo(),
          const SizedBox(height: 32),
          MText(text: 'Products', fontweight: FontWeight.w500, color: green, size: 24)
        ],
      ),
    );
  }
}
