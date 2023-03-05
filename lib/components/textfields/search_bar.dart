import 'package:flutter/material.dart';

import '../../constants/color_pallete.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a product',
          hintStyle: TextStyle(color: pink, fontWeight: FontWeight.w600, fontSize: 18),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: pink,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.transparent),
            borderRadius: BorderRadius.circular(24.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.transparent),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
