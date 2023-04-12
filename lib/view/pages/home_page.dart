import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_api.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/widgets/favorites.dart';
import 'package:recipes/view/widgets/page_view_builder.dart';
import 'package:recipes/view/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double width = constraints.maxWidth;
              double height = constraints.maxHeight;

              return ListView(
                children: const [
                  SearchBar(),
                  SizedBox(height: 40),
                  PageViewBuilder(),
                  Favorites(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
