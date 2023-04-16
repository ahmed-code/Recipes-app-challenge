import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipes/cubits/recipes_cubit/recipes_cubit.dart';
import 'package:recipes/view/widgets/cards/large_recipes_card.dart';
import '../../cubits/favorites_cubit/favorites_cubit.dart';
import '../../model/recipe_model.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.9);

    return BlocBuilder<RecipesCubit, List<RecipeModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          if (context.read<RecipesCubit>().dataFetched) {
            return Container(
              height: 450,
              alignment: Alignment.center,
              child: const Text(
                "no result",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 450,
          child: ValueListenableBuilder(
            valueListenable: Hive.box("favoritesBox").listenable(),
            builder: (context, box, child) {
              return PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return LargeRecipesCard(
                    recipeModel: state[index],
                    isFavorite:
                        context.read<FavoritesCubit>().isFavorite(state[index]),
                    favoriteOnPressed: () {
                      var instance = BlocProvider.of<FavoritesCubit>(context);
                      if (instance.isFavorite(state[index])) {
                        instance.deleteFromFavorite(state[index]);
                      } else {
                        instance.addToFavorite(state[index]);
                      }
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
