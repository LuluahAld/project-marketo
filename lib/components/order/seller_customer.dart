import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';

class sellerCustomerInfo extends StatelessWidget {
  const sellerCustomerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: lightgrey,
        borderRadius: borderRad,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('customer info'),
              SizedBox(
                height: 10,
              ),
              Text('seller info'),
            ],
          ),
        ],
      ),
    );
  }
}
