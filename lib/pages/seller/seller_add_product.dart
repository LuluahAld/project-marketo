import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/textfields/textfield_m.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/pages/seller/Sbotton.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: greyLight,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          title: const Logo(
            size: 200,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            MText(text: 'Product Name', fontweight: FontWeight.bold, color: lightgreen, size: 16),
            const SizedBox(
              height: 10,
            ),
            const TextFieldM(
              hint: 'Name',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText(text: 'Price', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextFieldM(
                        hint: 'Price',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText(text: 'Brand', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextFieldM(
                        hint: 'Brand',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MText(text: 'Category', fontweight: FontWeight.bold, color: lightgreen, size: 16),
            const SizedBox(
              height: 10,
            ),
            const TextFieldM(
              hint: 'Category',
            ),
            const SizedBox(
              height: 20,
            ),
            MText(text: 'Description', fontweight: FontWeight.bold, color: lightgreen, size: 16),
            const SizedBox(
              height: 10,
            ),
            const TextFieldM(
              hint: 'Description',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '+ Choose Image',
              style: TextStyle(color: lightgreen, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Sbutton(
              color: lightgreen,
              text: 'Add Product',
              NavChoice: 2,
            )
          ],
        ));
  }
}
