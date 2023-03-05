import 'package:flutter/material.dart';

class appBar2 extends StatelessWidget {
  const appBar2({required this.text, required this.icon1, required this.icon2, required this.choise, super.key});
  final text;
  final icon1;
  final icon2;
  final choise;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back,
        ),
        Text(
          text,
        ),
        if (choise == 1)
          Icon(
            icon1,
          ),
        if (choise == 2)
          Row(
            children: [
              Icon(
                icon1,
              ),
              Icon(
                icon2,
              ),
            ],
          ),
      ],
    );
  }
}
