import 'package:flutter/material.dart';

import '../../constants/color_pallete.dart';

class Avatar extends StatelessWidget {
  final String initial;
  final double? radius;
  const Avatar({
    super.key,
    required this.initial,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: pink,
      radius: radius,
      child: Text(
        initial,
        style: TextStyle(fontSize: radius, color: green),
      ),
    );
  }
}
