import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';

class scheduleTime extends StatefulWidget {
  const scheduleTime({super.key});

  @override
  State<scheduleTime> createState() => _scheduleTimeState();
}

String? text;

class _scheduleTimeState extends State<scheduleTime> {
  bool selectedSched = false;
  String? dateN;

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
          InkWell(
            onTap: () {
              _openDateTimePicker(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: grey,
                borderRadius: borderRad,
              ),
              child: Center(
                child: Column(
                  children: const [
                    Text('Schedule Time'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (selectedSched)
            Text(
              text.toString(),
            ),
        ],
      ),
    );
  }

  void _openDateTimePicker(BuildContext context) {
    BottomPicker.dateTime(
      buttonText: '               OK               ',
      buttonTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      displayButtonIcon: false,
      title: 'Delivery Time',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        selectedSched = true;
        dateN = DateFormat.yMd().add_jm().format(date);
        text = 'Scheduled to arrive at $dateN';
        setState(() {});
      },
      onClose: () {
        selectedSched = false;
        setState(() {});
      },
      iconColor: Colors.black,
      minDateTime: DateTime.now().add(const Duration(days: 7)),
      maxDateTime: DateTime.now().add(const Duration(days: 30)),
      initialDateTime: DateTime.now().add(const Duration(days: 7)),
      gradientColors: [green, green],
    ).show(context);
  }
}
