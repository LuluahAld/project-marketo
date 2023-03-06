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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: padding,
                      child: Image.asset('images/pic1.png'),
                    ),
                    Positioned(
                        left: 30,
                        top: 30,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back))),
                  ],
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
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: MText(text: 'Description', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    button(
                      text: 'Add to cart',
                      color: lightgreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
