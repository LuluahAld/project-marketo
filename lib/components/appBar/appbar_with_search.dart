import 'package:flutter/material.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/textfields/search_bar.dart';
import 'package:project_teamd/constants/color_pallete.dart';

class appBarwirhSearch extends StatelessWidget {
  const appBarwirhSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 135,
      color: grey,
      child: Column(
        children: const [
          Logo(size: 200),
          SizedBox(
            height: 50,
            width: 300,
            child: SearchBar(),
          ),
        ],
      ),
    );
  }
}
