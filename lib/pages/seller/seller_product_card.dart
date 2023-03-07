import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';

class SProsuctCard extends StatefulWidget {
  SProsuctCard({Key? key, required this.product}) : super(key: key);
  Product product;
  @override
  State<SProsuctCard> createState() => _SProsuctCard();
}

class _SProsuctCard extends State<SProsuctCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Image.asset(
                  widget.product.imageUrl,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MText(text: widget.product.name, fontweight: FontWeight.normal, color: green, size: 16),
                      const SizedBox(
                        width: 10,
                      ),
                      MText(text: '${widget.product.price} SAR', fontweight: FontWeight.normal, color: green, size: 16),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MText(text: widget.product.category, fontweight: FontWeight.normal, color: green, size: 16),
                      const SizedBox(
                        width: 10,
                      ),
                      MText(text: widget.product.brand, fontweight: FontWeight.normal, color: green, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
