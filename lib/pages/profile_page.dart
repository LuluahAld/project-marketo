import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/profile/avatar.dart';
import 'package:project_teamd/constants/color_pallete.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.3,
      width: double.infinity,
      decoration: BoxDecoration(color: grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 28),
          Avatar(initial: 'M', radius: 70),
          SizedBox(height: 20),
          MText(text: '@username', fontweight: FontWeight.w500, color: Colors.black, size: 20)
        ],
      ),
    );
  }
}
