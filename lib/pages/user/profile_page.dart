import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/profile/avatar.dart';
import 'package:project_teamd/components/profile/profile_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.3,
          width: double.infinity,
          decoration: BoxDecoration(color: grey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 32),
              Avatar(initial: 'M', radius: 68),
              SizedBox(height: 20),
              MText(text: '@username', fontweight: FontWeight.w500, color: Colors.black, size: 20)
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 28),
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
          ],
        )
      ],
    );
  }
}
