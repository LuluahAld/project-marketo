import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';

import '../user/user_product_details.dart';

class SProductCard extends StatefulWidget {
  SProductCard({Key? key, required this.product, required this.cardWidth, required this.productImgWidth})
      : super(key: key);
  Product product;
  double cardWidth;
  double productImgWidth;
  @override
  State<SProductCard> createState() => _SProsuctCard();
}

class _SProsuctCard extends State<SProductCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widget.cardWidth,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProductDetails(
                                      pro: widget.product,
                                    )));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          width: widget.productImgWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                          ),
                          child: Image.network(
                            widget.product.imageUrl,
                            fit: BoxFit.contain,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.product.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.normal, color: green, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MText(
                                text: '${widget.product.price} SAR',
                                fontweight: FontWeight.normal,
                                color: green,
                                size: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
        const SizedBox(
          width: 12,
        )
      ],
    );
  }
}
