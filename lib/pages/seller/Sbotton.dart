import 'package:flutter/material.dart';
import 'package:project_teamd/pages/seller/Shome.dart';
import 'package:project_teamd/pages/seller/seller_add_product.dart';

class Sbutton extends StatelessWidget {
  final color;
  final text;
  final NavChoice;
  const Sbutton({super.key, required this.color, required this.text, required this.NavChoice});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        if (NavChoice == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProduct()));
        }
        if (NavChoice == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SHome()));
        }
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
