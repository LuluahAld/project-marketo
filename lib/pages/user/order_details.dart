import 'package:flutter/material.dart';

import '../../components/appText/m_text.dart';
import '../../constants/color_pallete.dart';

class OrderDetials extends StatelessWidget {
  const OrderDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: greyLight,
        title: MText(
          text: "My Order",
          fontweight: FontWeight.bold,
          color: green,
          size: 20,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: green,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
    );
  }
}
