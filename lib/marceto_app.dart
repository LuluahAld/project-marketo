import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/pages/login_page.dart';
import 'package:project_teamd/pages/onboarding_pages.dart';
import 'package:project_teamd/pages/seller/Shome.dart';
import 'package:project_teamd/pages/seller/seller_login_page.dart';
import 'package:project_teamd/pages/user/home.dart';

import 'model/seller.dart';
import 'model/user.dart';

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
    listenToUsers() {
      // ignore: await_only_futures
      FirebaseFirestore.instance.collection('user').snapshots().listen(
        (collection) {
          List<Users> newList = [];
          for (final doc in collection.docs) {
            final usersN = Users.fromMap(doc.data());
            newList.add(usersN);
          }
          users = newList;
          print(users.length);

          setState(() {});
        },
      );
      listenToSellers() {
        FirebaseFirestore.instance.collection('seller').snapshots().listen(
          (collection) {
            List<Seller> newList = [];
            for (final doc in collection.docs) {
              final usersN = Seller.fromMap(doc.data());
              newList.add(usersN);
            }
            sellers = newList;

            setState(() {});
          },
        );
      }

      listenToSellers();
    }

    listenToUsers();
    super.initState();
  }

  late Widget home;
  @override
  Widget build(BuildContext context) {
    if (isUser) {
      home = const Home();
      setState(() {});
    } else {
      home = const SHome();
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
