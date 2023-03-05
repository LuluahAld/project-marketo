import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({required this.text, required this.choise, super.key});
  final text;
  final choise;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (choise == 1 || choise == 0)
          const Icon(
            Icons.arrow_back,
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
        ),
        if (choise == 2 || choise == 0)
          Text(
            text,
          ),
      ],
    );
  }
}
