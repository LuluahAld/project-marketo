import 'package:flutter/material.dart';
import 'package:project_teamd/home.dart';

class MarcetoApp extends StatelessWidget {
  const MarcetoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
