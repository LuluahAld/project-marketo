import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';

class orderInfoCard extends StatelessWidget {
  orderInfoCard({
    super.key,
    required this.order,
  });
  Orders order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order Id:  ${order.id}"),
              const SizedBox(
                height: 10,
              ),
              Text(order.orderDate.toString()),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${order.total} SAR'),
              const SizedBox(
                height: 10,
              ),
              Text(order.orderStatus),
            ],
          ),
        ],
      ),
    );
  }
}
