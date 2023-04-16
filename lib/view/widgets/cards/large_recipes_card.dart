import 'package:flutter/material.dart';
import 'package:recipes/view/pages/details.dart';

import '../../../model/recipe_model.dart';

class LargeRecipesCard extends StatelessWidget {
  final RecipeModel recipeModel;
  final void Function()? favoriteOnPressed;
  final bool isFavorite;
  const LargeRecipesCard(
      {super.key,
      required this.recipeModel,
      required this.favoriteOnPressed,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    String rating = "";
    if (recipeModel.userRatings?["score"] == null) {
      rating = "0.0";
    } else {
      double rate = recipeModel.userRatings!["score"] * 5.0;
      rating = rate.toStringAsPrecision(2).toString();
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              recipeModel: recipeModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    recipeModel.thumbnailUrl!,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                recipeModel.name!,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    rating,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFAD23F),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: favoriteOnPressed,
                    icon: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
