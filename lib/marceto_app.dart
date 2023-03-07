import 'package:flutter/material.dart';
import 'package:project_teamd/pages/onboarding_pages.dart';

class MarcetoApp extends StatelessWidget {
  const MarcetoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
