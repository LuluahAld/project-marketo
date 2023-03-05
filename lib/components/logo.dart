import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final size;
  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/logo.png',
      width: size,
    );
  }
}
