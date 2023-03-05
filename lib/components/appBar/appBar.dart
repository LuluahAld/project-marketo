import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({required this.text, required this.icon1, required this.icon2, required this.choise, super.key});
  final text;
  final icon1;
  final icon2;
  final choise;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
