import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
        onSubmitted: (value) {},
      ),
    );
  }
}
