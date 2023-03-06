import 'package:flutter/material.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';

class scheduleTime extends StatelessWidget {
  const scheduleTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightgrey,
          borderRadius: borderRad,
        ),
        child: Column(
          children: [
            const Text('When would you like to receive your order?'),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: borderRad,
                ),
                child: const Center(child: Text('Schedule Time'))),
          ],
        ));
  }
}
