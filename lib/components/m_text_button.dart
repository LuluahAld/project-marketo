import 'package:flutter/material.dart';

class MTextButton extends StatelessWidget {
  final text;
  final color;
  final Function ontap;
  const MTextButton({super.key, required this.text, required this.color, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 24, decoration: TextDecoration.underline, color: color),
      ),
    );
  }
}
