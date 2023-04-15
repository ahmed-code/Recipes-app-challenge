import 'package:flutter/material.dart';
import 'package:recipes/view/widgets/ingredients.dart';
import 'package:recipes/view/widgets/instructions.dart';

import '../../model/recipe_model.dart';

class DetailsBottomSide extends StatelessWidget {
  final RecipeModel recipeModel;
  const DetailsBottomSide({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    String time = "";
    if (recipeModel.totalTimeMinutes == null) {
      time = "0.0";
    } else {
      time = recipeModel.totalTimeMinutes.toString();
    }
    String rating = "";
    if (recipeModel.userRatings?["score"] == null) {
      rating = "0.0";
    } else {
      double rate = recipeModel.userRatings!["score"] * 5.0;
      rating = rate.toStringAsPrecision(2).toString();
    }
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Align(
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                recipeModel.name!,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Text(
              rating,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Icon(
              Icons.star,
              size: 24,
              color: Color(
                0xFFFAD23F,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        time == "0.0"
            ? Container()
            : Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    size: 24,
                    color: Color(0xFFB9B9B9),
                  ),
                  Text(
                    "$time mins",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFB9B9B9),
                    ),
                  )
                ],
              ),
        recipeModel.topics!.length == 0
            ? Container()
            : Ingredients(
                ingredients: recipeModel.topics!,
              ),
        recipeModel.instructions!.length == 0
            ? Container()
            : Instructions(
                instructions: recipeModel.instructions!,
              ),
      ],
    );
  }
}
