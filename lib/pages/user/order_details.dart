import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appbar_local.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_info_card.dart';
import 'package:project_teamd/components/order/order_status.dart';
import 'package:project_teamd/components/order/seller_customer.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/model/product.dart';

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
          const SizedBox(height: 48),
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
            const SizedBox(height: 12)
          ]
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
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(product.category),
                    const SizedBox(height: 4),
                  ],
                ),
                const SizedBox(width: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.price} SAR'),
                    const SizedBox(height: 4),
                    Text(product.brand),
                    const SizedBox(height: 4),
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
              child: Image.network(product.imageUrl)),
        ],
      ),
    );
  }
}
