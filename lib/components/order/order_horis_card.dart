import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/order.dart';

class orderHorisCard extends StatelessWidget {
  orderHorisCard({super.key, required this.order, required this.icon});
  Orders order;
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
          child: Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.shopName),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Total'),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(order.numOfProduct),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(order.orderDate),
                  ],
                ),
              ],
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
