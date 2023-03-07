import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';
import 'package:project_teamd/pages/seller/Sbotton.dart';
import 'package:project_teamd/pages/seller/seller_product_details.dart';
import 'package:project_teamd/pages/seller/seller_product_horis_card.dart';

class SellerPListPage extends StatelessWidget {
  const SellerPListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        color: grey,
        child: Column(
          children: const [
            SizedBox(height: 56),
            Logo(size: 230),
            SizedBox(height: 8),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MText(text: 'Products', fontweight: FontWeight.bold, color: green, size: 20),
              SizedBox(
                width: 200,
                child: Sbutton(
                  text: ' + Add Product',
                  color: lightgreen,
                  NavChoice: 1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SellerProductDetails(
                            product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
                          )));
            },
            child: SProductHorisCard(
              product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SProductHorisCard(
            product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          SProductHorisCard(
            product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          SProductHorisCard(
            product: const Product('id', 'name', 100, 'brand', 'category', 4.5, 'images/pic1.png'),
          ),
        ],
      ),
    ]));
  }
}
