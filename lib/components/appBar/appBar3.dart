import 'package:flutter/material.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/profile/avatar.dart';

class appBar3 extends StatelessWidget {
  const appBar3({required this.choise, super.key});

  final choise;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (choise == 0)
          const Icon(
            Icons.arrow_back,
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
        ),
        const Logo(
          size: 150,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
        ),
        if (choise == 1)
          const Avatar(
            initial: 'M',
            radius: 15,
          ),
      ],
    );
  }
}
