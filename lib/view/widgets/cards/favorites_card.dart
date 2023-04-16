import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';

import '../../pages/details.dart';

class FavoriteCard extends StatelessWidget {
  final RecipeModel recipeModel;
  const FavoriteCard({super.key, required this.recipeModel});

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
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        padding: const EdgeInsets.all(5),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black12,
              )
            ]),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    recipeModel.thumbnailUrl!,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    recipeModel.name!,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(
                        0xFFFAD23F,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
