import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appbar_local.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/order/order_status.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';
import 'package:project_teamd/model/product.dart';

import '../../constants/color_pallete.dart';

class SOrderDetials extends StatelessWidget {
  SOrderDetials({super.key, required this.order});
  Orders order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLocal(title: 'Order #${order.id}'),
      body: ListView(
        padding: padding,
        children: [
          const SizedBox(height: 24),
          orderStatus(
            order: order,
          ),
          const SizedBox(height: 48),
          MText(text: 'Products', fontweight: FontWeight.w500, color: lightgreen, size: 24),
          const SizedBox(height: 16),
          for (var product in order.products) ...[
            OrderDetailsCard(product: product),
            const SizedBox(
              height: 12,
            )
          ],
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 70),
          if (order.orderStatus == 'In Progress')
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: grey,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                final Orders orderNow = Orders(
                    id: order.id,
                    orderStatus: 'On the Way',
                    orderDate: order.orderDate,
                    shopName: order.shopName,
                    numOfProduct: order.numOfProduct,
                    products: order.products,
                    total: order.total);
                final collection = FirebaseFirestore.instance.collection('order');
                collection.doc(orderNow.id).set(orderNow.toMap());
              },
              child: const Text(
                'On the Way',
                style: TextStyle(fontSize: 16),
              ),
            ),
          const SizedBox(height: 10),
          if (order.orderStatus == 'On the Way')
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pink,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                final Orders orderNow = Orders(
                    id: order.id,
                    orderStatus: 'Delivered',
                    orderDate: order.orderDate,
                    shopName: order.shopName,
                    numOfProduct: order.numOfProduct,
                    products: order.products,
                    total: order.total);
                final collection = FirebaseFirestore.instance.collection('order');
                collection.doc(orderNow.id).set(orderNow.toMap());
              },
              child: const Text(
                'Delivered',
                style: TextStyle(fontSize: 16),
              ),
            ),
          const SizedBox(height: 10),
          if (order.orderStatus == 'Pending')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightgreen,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      final Orders orderNow = Orders(
                          id: order.id,
                          orderStatus: 'In Progress',
                          orderDate: order.orderDate,
                          shopName: order.shopName,
                          numOfProduct: order.numOfProduct,
                          products: order.products,
                          total: order.total);
                      final collection = FirebaseFirestore.instance.collection('order');
                      collection.doc(orderNow.id).set(orderNow.toMap());
                    },
                    child: const Text(
                      'Accept',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      final orderdoc = FirebaseFirestore.instance.collection('order');
                      final orDoc = orderdoc.doc(order.id);
                      orDoc.delete();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Decline',
                      style: TextStyle(fontSize: 16),
                    ),
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
                    SizedBox(
                      width: 160,
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(product.category),
                    const SizedBox(height: 4),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
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
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: ClipRRect(borderRadius: borderRad, child: Image.network(product.imageUrl))),
        ],
      ),
    );
  }
}
