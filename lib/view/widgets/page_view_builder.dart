import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipes/cubits/recipes_cubit/recipes_cubit.dart';
import 'package:recipes/view/widgets/cards/large_recipes_card.dart';

import '../../model/recipe_model.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.877);

    return BlocBuilder<RecipesCubit, List<RecipeModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 450,
          child: ValueListenableBuilder(
              valueListenable: Hive.box("favorites").listenable(),
              builder: (context, box, child) {
                return PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return LargeRecipesCard(
                      recipeModel: state[index],
                      favoriteOnPressed: () {
                        // if (box.get("favorites") != null) {
                        //   List<RecipeModel> cureentFavorites =
                        //       box.get("favorites");
                        // } else {
                        //   print("____");
                        //   box.put("favorites", "--");
                        // }
                      },
                    );
                  },
                );
              }),
        );
      },
    );
  }
}
