import 'package:flutter/material.dart';
import 'package:recipes/view/widgets/favorites.dart';
import 'package:recipes/view/widgets/page_view_builder.dart';
import 'package:recipes/view/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 253, 246),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              SearchBar(),
              SizedBox(height: 20),
              PageViewBuilder(),
              SizedBox(height: 20),
              Favorites(),
            ],
          ),
        ),
      ),
    );
  }
}
