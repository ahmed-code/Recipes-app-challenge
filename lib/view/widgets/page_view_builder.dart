import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: state.length,
            itemBuilder: (context, index) {
              String rating = "";
              if (state[index].userRatings?["score"] == null) {
                rating = "null";
              } else {
                double rate = state[index].userRatings!["score"] * 5.0;
                rating = rate.toStringAsPrecision(2).toString();
              }
              return LargeRecipesCard(
                name: state[index].name!,
                img: state[index].thumbnailUrl!,
                rating: rating == "null" ? "0.0" : rating,
              );
            },
          ),
        );
      },
    );
  }
}
