import 'package:flutter/material.dart';

import 'components/onboarding/onboarding.dart';

class MarcetoApp extends StatelessWidget {
  const MarcetoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
