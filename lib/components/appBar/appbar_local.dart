import 'package:flutter/material.dart';

import '../../constants/color_pallete.dart';
import '../appText/m_text.dart';

class AppBarLocal extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const AppBarLocal({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0.5,
      centerTitle: true,
      backgroundColor: grey,
      title: MText(
        text: title,
        fontweight: FontWeight.bold,
        color: green,
        size: 20,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
