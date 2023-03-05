import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final color;
  final text;
  const button({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
