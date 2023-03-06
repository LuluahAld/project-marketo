import 'package:flutter/material.dart';

import '../../constants/padding.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          children: const [
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
