import 'package:flutter/material.dart';
import 'package:project_teamd/constants.dart';

class ProfileCard extends StatelessWidget {
  final icon;
  final text;
  const ProfileCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: pink,
          size: 36,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
