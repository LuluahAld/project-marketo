import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/model/user.dart';

import '../../constants/color_pallete.dart';

class OrderLocationCard extends StatelessWidget {
  const OrderLocationCard(this.user, {super.key});
  final Users user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            child: Column(children: [
      Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgrey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: green,
                          size: 24,
                        ),
                        MText(text: 'Location', fontweight: FontWeight.normal, color: green, size: 24),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MText(text: currentUser.location, fontweight: FontWeight.normal, color: green, size: 20),
                  ],
                ),
              ],
            ),
          )),
    ])));
  }
}
