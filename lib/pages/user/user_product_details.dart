import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/buttons/button.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';

class UserProductDetails extends StatelessWidget {
  const UserProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: padding,
              child: Image.asset('images/pic1.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: MText(text: 'Product Name', fontweight: FontWeight.bold, color: lightgreen, size: 16),
              ),
              Material(
                color: Colors.transparent,
                child: MText(text: 'Price', fontweight: FontWeight.bold, color: lightgreen, size: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: MText(text: 'Category', fontweight: FontWeight.bold, color: lightgreen, size: 16),
              ),
              Material(
                color: Colors.transparent,
                child: MText(text: 'Brand', fontweight: FontWeight.bold, color: lightgreen, size: 16),
              ),
            ],
          ),
          const Divider(),
          Material(
            color: Colors.transparent,
            child: MText(text: 'Description', fontweight: FontWeight.bold, color: lightgreen, size: 16),
          ),
          const SizedBox(
            height: 30,
          ),
          button(
            text: 'Add to cart',
            color: lightgreen,
          ),
        ],
      ),
    );
  }
}
