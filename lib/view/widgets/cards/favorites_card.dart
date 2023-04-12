import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      padding: const EdgeInsets.all(5),
      height: 70,
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
            width: 50,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Baked cod with creamy",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "4.5",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
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
    );
  }
}
