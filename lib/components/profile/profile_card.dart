import 'package:flutter/material.dart';

import '../../constants/color_pallete.dart';

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
        const SizedBox(width: 12),
        Icon(
          icon,
          color: pink,
          size: 32,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
