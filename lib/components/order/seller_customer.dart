import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/seller.dart';

import '../../model/order.dart';

class sellerCustomerInfo extends StatelessWidget {
  final Orders order;
  const sellerCustomerInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    var shopname = order.products[0].shopName;
    Seller seller = Seller(
        name: 'name',
        userName: 'userName',
        email: 'email',
        about: 'about',
        review: [],
        id: 'id',
        logo: 'logo',
        location: 'location',
        letter: 'letter',
        orders: orders,
        product: [],
        rating: 5);
    for (var i = 0; i < sellers.length; i++) {
      if (sellers[i].name == shopname) {
        seller = sellers[i];
      }
    }
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
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(seller.name),
            ],
          ),
        ],
      ),
    );
  }
}
