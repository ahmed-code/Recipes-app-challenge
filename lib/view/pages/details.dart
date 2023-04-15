import 'package:flutter/material.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/view/widgets/details_bottom_side.dart';
import 'package:recipes/view/widgets/details_top_side.dart';
import 'package:recipes/view/widgets/ingredients.dart';
import 'package:flutter/services.dart';

class Details extends StatefulWidget {
  final RecipeModel recipeModel;
  const Details({super.key, required this.recipeModel});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEFB),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;

            return Stack(
              children: [
                DetailsTopSide(
                  imgUrl: widget.recipeModel.thumbnailUrl!,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.favorite_border),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height / 1.7,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFEFB),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: DetailsBottomSide(
                      recipeModel: widget.recipeModel,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
