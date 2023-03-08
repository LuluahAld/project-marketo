import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/pages/login_page.dart';
import 'package:project_teamd/pages/onboarding_pages.dart';
import 'package:project_teamd/pages/seller/Shome.dart';
import 'package:project_teamd/pages/seller/seller_login_page.dart';
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

  Widget home = const Home();
  @override
  Widget build(BuildContext context) {
    if (isUser) {
      home = const Home();
      setState(() {});
    }
    if (isSeller) {
      home = const SHome();
      setState(() {});
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? home : const OnBoardingPage(),
    );
  }
}
