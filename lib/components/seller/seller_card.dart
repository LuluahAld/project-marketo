import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';

class SellerCard extends StatefulWidget {
  SellerCard({Key? key, required this.seller}) : super(key: key);
  Seller seller;
  @override
  State<SellerCard> createState() => _SellerCard();
}

class _SellerCard extends State<SellerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Image.asset(
                  widget.seller.logo,
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(text: widget.seller.name, fontweight: FontWeight.normal, color: green, size: 16),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(
                        width: 4,
                      ),
                      MText(text: widget.seller.location, fontweight: FontWeight.normal, color: green, size: 16),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.star_rate_rounded, color: Colors.amber),
                      const SizedBox(
                        width: 10,
                      ),
                      MText(text: widget.seller.rating, fontweight: FontWeight.normal, color: green, size: 20),
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
