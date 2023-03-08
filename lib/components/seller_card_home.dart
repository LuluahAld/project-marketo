import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/seller.dart';

class SellerCardHome extends StatefulWidget {
  SellerCardHome({
    Key? key,
    required this.seller,
  }) : super(key: key);
  Seller seller;

  @override
  State<SellerCardHome> createState() => _SellerCardHomeState();
}

class _SellerCardHomeState extends State<SellerCardHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 12, top: 14),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width / 2.7,
                height: MediaQuery.of(context).size.height / 5.5,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height / 11,
                            width: MediaQuery.of(context).size.width / 2.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: Image.network(
                              widget.seller.logo,
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MText(text: widget.seller.name, fontweight: FontWeight.normal, color: green, size: 13)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
