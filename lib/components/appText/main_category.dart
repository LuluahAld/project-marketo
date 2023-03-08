import 'package:flutter/material.dart';
import 'package:project_teamd/pages/user/product_list_page.dart';
import 'package:project_teamd/pages/user/seller_page.dart';

import 'm_text.dart';

class MainCategory extends StatefulWidget {
  const MainCategory(this.title, this.text, this.titleColor, this.textColor, this.navigatorChoise, {super.key});
  final String title;
  final String text;
  final Color titleColor;
  final Color textColor;
  final int navigatorChoise;

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MText(text: widget.title, fontweight: FontWeight.bold, color: widget.titleColor, size: 20),
            InkWell(
                onTap: () {
                  if (widget.navigatorChoise == 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SellerPage()));
                  }
                  if (widget.navigatorChoise == 2) {
                    navigateSecondPage();
                  }
                },
                child: MText(text: widget.text, fontweight: FontWeight.bold, color: widget.textColor, size: 20)),
          ],
        ),
      ),
    ])));
  }

  void refreshData() {}

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => const ProductListPage());
    Navigator.push(context, route).then(onGoBack);
  }
}
