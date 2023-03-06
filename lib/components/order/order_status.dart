import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';

class orderStatus extends StatelessWidget {
  const orderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.pending_actions,
          color: green,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 120,
          child: Divider(
            color: green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.local_shipping,
          color: green,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 120,
          child: Divider(
            color: green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.check,
          color: green,
        )
      ],
    );
  }
}
