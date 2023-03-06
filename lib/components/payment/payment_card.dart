import 'package:flutter/material.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/constants/padding.dart';

class paymentCard extends StatelessWidget {
  const paymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightgrey,
          borderRadius: borderRad,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MText(
              text: 'Pay with',
              size: 16,
              color: Colors.black,
              fontweight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Card Number'),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: green),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: lightgreen),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Expiry Date'),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: lightgreen),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('CVV'),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: lightgreen),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Cardholder Name'),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: green),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: lightgreen),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ));
  }
}
