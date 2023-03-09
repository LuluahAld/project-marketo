import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';
import 'package:project_teamd/model/appData.dart';
import 'package:project_teamd/pages/user/user_home_page.dart';

import '../../model/product.dart';

class UserProductDetails extends StatelessWidget {
  const UserProductDetails({super.key, required this.pro});

  final Product pro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: green),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(width: 0.0, color: green),
              borderRadius: const BorderRadius.all(Radius.circular(10.0) //                 <--- border radius here
                  ),
            ),
            padding: const EdgeInsets.all(40),
            child: ClipRRect(
              borderRadius: borderRad,
              child: Image.network(
                pro.imageUrl,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2.3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: Expanded(
                    child: Text(
                      pro.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: MText(text: pro.category, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: MText(text: pro.brand, fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MText(text: '${pro.price} SAR', fontweight: FontWeight.bold, color: green, size: 16),
                  ],
                ),
                const Divider(
                  height: 50,
                  thickness: 1,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(fontSize: 16, color: green, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    pro.description,
                    style: TextStyle(
                      // fontWeight: FontWeight.w00,
                      color: lightgreen,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightgreen,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    appData.cart.add(pro);
                    context.findAncestorStateOfType<UserHomePageState>()?.showCart = true;
                    context.findAncestorStateOfType<UserHomePageState>()?.setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                // button(
                //   text: 'Add to cart',
                //   color: lightgreen,
                //   NavChoice: 2,
                // ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
