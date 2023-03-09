import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appbar_local.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_info_card.dart';
import 'package:project_teamd/components/order/order_status.dart';
import 'package:project_teamd/components/order/seller_customer.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/model/product.dart';

import '../../components/buttons/button.dart';
import '../../components/help_customer_card.dart';
import '../../constants/color_pallete.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key, required this.order});
  Orders order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLocal(title: 'Order #${order.id}'),
      body: ListView(
        padding: padding,
        children: [
          const SizedBox(height: 24),
          orderStatus(order: order),
          const SizedBox(height: 48),
          orderInfoCard(
            order: order,
          ),
          const SizedBox(height: 24),
          MText(text: 'Shopper Information', fontweight: FontWeight.w500, color: lightgreen, size: 24),
          const SizedBox(height: 16),
          sellerCustomerInfo(
            order: order,
          ),
          const SizedBox(height: 32),
          MText(text: 'Products', fontweight: FontWeight.w500, color: lightgreen, size: 24),
          const SizedBox(height: 16),
          for (var product in order.products) ...[
            OrderDetailsCard(
              product: product,
            ),
            const SizedBox(
              height: 16,
            )
          ],
          const SizedBox(height: 24),
          MText(text: 'Help', fontweight: FontWeight.w500, color: lightgreen, size: 24),
          const SizedBox(height: 16),
          HelpCard(icon: Icons.chat, text1: "Need Help", text2: "Contact Us", text3: "Chat", iconSize: 36),
          const SizedBox(height: 24),
          HelpCard(
              icon: Icons.delivery_dining, text1: "Delivery Company", text2: "Aramex", text3: "Chat", iconSize: 36),
          const SizedBox(height: 24),
          button(color: lightgreen.withOpacity(0.8), text: "View Invoice", NavChoice: 2)
        ],
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  final Product product;
  const OrderDetailsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightgrey,
        borderRadius: borderRad,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text('${product.price} SAR'),
                            Text(product.brand),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                    color: grey,
                  ),
                  child: Image.network(product.imageUrl)),
            ],
          ),
        ],
      ),
    );
  }
}
