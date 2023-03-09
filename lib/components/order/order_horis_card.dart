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
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: lightgrey,
            borderRadius: borderRad,
          ),
          child: Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(order.shopName),
                        const SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Number: #${order.id}"),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
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
              color: pink.withOpacity(0.3),
              borderRadius: borderRad,
            ),
            child: Icon(
              icon,
              color: green,
              size: 30,
            )),
      ],
    );
  }
}
