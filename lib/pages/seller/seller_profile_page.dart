import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/profile/avatar.dart';
import 'package:project_teamd/components/profile/profile_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';
import 'package:project_teamd/pages/seller/seller_login_page.dart';

class SProfilePage extends StatefulWidget {
  const SProfilePage({super.key});

  @override
  State<SProfilePage> createState() => _SProfilePageState();
}

class _SProfilePageState extends State<SProfilePage> {
  bool isLoggedIn = false;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      isLoggedIn = user != null;
      setState(() {});
      isLoggedIn = user != null;
      setState(() {});

      if (isLoggedIn) {
        setState(() {
          isSeller = true;
        });

        for (var i = 0; i < sellers.length; i++) {
          if (sellers[i].id == user?.uid) {
            currentSeller = sellers[i];

            setState(() {});
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.3,
          width: double.infinity,
          decoration: BoxDecoration(color: grey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              if (user != null) Avatar(initial: currentSeller.userName[0].toUpperCase(), radius: 68),
              const SizedBox(height: 20),
              if (user != null)
                MText(text: '@${currentSeller.userName}', fontweight: FontWeight.w500, color: Colors.black, size: 20)
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
            children: [
              MText(text: 'My Marketo', fontweight: FontWeight.w500, color: green, size: 20),
              const SizedBox(height: 16),
              const ProfileCard(icon: Icons.bookmark_border, text: 'Orders'),
              const SizedBox(height: 12),
              const ProfileCard(icon: Icons.send_time_extension_outlined, text: 'Invite Friends'),
              const Divider(thickness: 1, height: 40),
              MText(text: 'Settings', fontweight: FontWeight.w500, color: green, size: 20),
              const SizedBox(height: 16),
              const ProfileCard(icon: Icons.settings_outlined, text: 'Preferences'),
              const SizedBox(height: 12),
              const ProfileCard(icon: Icons.person_outline, text: 'Account'),
              const Divider(thickness: 1, height: 40),
              MText(text: 'Resources', fontweight: FontWeight.w500, color: green, size: 20),
              const SizedBox(height: 16),
              const ProfileCard(icon: Icons.support_outlined, text: 'Support'),
              const SizedBox(height: 12),
              const ProfileCard(icon: Icons.policy_outlined, text: 'Community & legal'),
              const SizedBox(height: 12),
              const ProfileCard(icon: Icons.question_answer_outlined, text: 'Share Feedback'),
              const Divider(thickness: 1, height: 40),
              InkWell(
                onTap: () {
                  isSeller = false;
                  FirebaseAuth.instance.signOut();
                },
                child: const ProfileCard(icon: Icons.logout, text: 'Logout'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        )
      ],
    );
  }
}
