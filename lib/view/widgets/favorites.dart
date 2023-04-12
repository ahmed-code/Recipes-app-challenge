import 'package:flutter/material.dart';
import 'package:recipes/view/widgets/cards/favorites_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
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
              4,
              (index) => const FavoriteCard(),
            ),
          ),
        ],
      ),
    );
  }
}
