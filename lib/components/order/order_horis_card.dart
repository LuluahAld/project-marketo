import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';

class orderHorisCard extends StatelessWidget {
  orderHorisCard({super.key, required this.order, required this.icon});
  Order order;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 10,
          padding: padding,
          decoration: BoxDecoration(
            color: lightgrey,
            borderRadius: borderRad,
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Shop name'),
                  Text(order.id),
                  Text(order.orderStatus),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Total'),
                  Text(order.product.length.toString()),
                  const Text('Order date'),
                ],
              ),
            ],
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
