import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/order.dart';

class orderStatus extends StatelessWidget {
  orderStatus({super.key, required this.order});
  Order order;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.pending_actions,
          color: green,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 120,
          child: Divider(
            color: green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (order.orderStatus == 'On the Way')
          Icon(
            Icons.local_shipping,
            color: green,
          ),
        if (order.orderStatus == 'In Progress' || order.orderStatus == 'Pending')
          Icon(
            Icons.local_shipping,
            color: grey,
          ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 120,
          child: Divider(
            color: green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (order.orderStatus == 'Delivered')
          Icon(
            Icons.check,
            color: green,
          ),
        if (order.orderStatus == 'In Progress' || order.orderStatus == 'Pending')
          Icon(
            Icons.check,
            color: grey,
          ),
      ],
    );
  }
}
