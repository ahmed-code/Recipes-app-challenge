import 'package:flutter/material.dart';

class DetailsTopSide extends StatelessWidget {
  final String imgUrl;
  const DetailsTopSide({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 2.3,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imgUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
