import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:recipes/cubits/favorites_cubit/favorites_cubit.dart';
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
      backgroundColor: const Color(0xFFFDFFF6),
      body: Stack(
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
                    onTap: () {
                      var instance = BlocProvider.of<FavoritesCubit>(context);
                      if (instance.isFavorite(widget.recipeModel)) {
                        instance.deleteFromFavorite(widget.recipeModel);
                      } else {
                        instance.addToFavorite(widget.recipeModel);
                      }
                    },
                    child: BlocBuilder<FavoritesCubit, List<RecipeModel>>(
                      builder: (context, state) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: context
                                  .read<FavoritesCubit>()
                                  .isFavorite(widget.recipeModel)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                        );
                      },
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
                color: Color.fromARGB(255, 252, 253, 246),
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
      ),
    );
  }
}
