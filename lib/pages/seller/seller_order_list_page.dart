import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/order/order_horis_card.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/order.dart';

class SellerOListPage extends StatelessWidget {
  const SellerOListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: grey,
                    child: Column(
                      children: const [
                        Logo(size: 200),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      MText(text: 'Orders', fontweight: FontWeight.bold, color: green, size: 20),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold()));
                        },
                        child: orderHorisCard(
                            order: const Order('', 'orderStatus', 'orderDate', 'shopName', 'numOfProduct', []),
                            icon: Icons.done)),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      height: 12,
                    ),
                  ),
                ]))));
  }
}
