import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldM extends StatelessWidget {
  final hint;
  const TextFieldM({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 18),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: green),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: lightgreen),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
