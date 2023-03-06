import 'package:flutter/material.dart';
import 'package:project_teamd/components/appBar/appbar_local.dart';

class OrderDetials extends StatelessWidget {
  const OrderDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarLocal(title: 'Order #12345'),
    );
  }
}
