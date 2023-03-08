import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/buttons/button.dart';
import 'package:project_teamd/constants/color_pallete.dart';

import '../../model/product.dart';

class UserProductDetails extends StatelessWidget {
  const UserProductDetails({super.key, required this.pro});

  final Product pro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: green),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: grey),
            padding: const EdgeInsets.all(40),
            child: Image.network(
              pro.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: MText(text: pro.name, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    ),
                    Material(
                      color: Colors.transparent,
                      child:
                          MText(text: pro.price.toString(), fontweight: FontWeight.bold, color: lightgreen, size: 16),
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
                      child: MText(text: pro.category, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: MText(text: pro.brand, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    ),
                  ],
                ),
                const Divider(
                  height: 100,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: MText(text: pro.description, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                button(
                  text: 'Add to cart',
                  color: lightgreen,
                  NavChoice: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
