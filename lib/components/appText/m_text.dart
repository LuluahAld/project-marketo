import 'package:flutter/material.dart';

class MText extends StatelessWidget {
  final text;
  final fontweight;
  final color;
  final double? size;
  const MText({
    super.key,
    required this.text,
    required this.fontweight,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontweight,
      ),
    );
  }
}
