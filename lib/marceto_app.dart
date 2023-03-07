import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/pages/onboarding_pages.dart';
import 'package:project_teamd/pages/user/home.dart';

class MarcetoApp extends StatefulWidget {
  const MarcetoApp({super.key});

  @override
  State<MarcetoApp> createState() => _MarcetoAppState();
}

class _MarcetoAppState extends State<MarcetoApp> {
  bool isLoggedIn = false;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      isLoggedIn = user != null;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const Home() : const OnBoardingPage(),
    );
  }
}
