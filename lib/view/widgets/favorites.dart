import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:recipes/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:recipes/view/widgets/cards/favorites_card.dart';

import '../../model/recipe_model.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<FavoritesCubit, List<RecipeModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Container();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Favorite",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                children: List.generate(
                  state.length,
                  (index) => FavoriteCard(
                    recipeModel: state[index],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
