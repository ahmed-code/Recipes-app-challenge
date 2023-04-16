import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:recipes/model/recipe_model.dart';

import '../../model/recipe_api.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<List<RecipeModel>> {
  RecipesCubit() : super([]);

  List<RecipeModel> searchList = [];
  bool dataFetched = false;
  getData() async {
    List result = await RecipeApi().getRecipes();

    List<RecipeModel> fetchedData =
        (result).map((data) => RecipeModel.fromJson(data)).toList();

    fetchedData[0].isFavorite = true;

    for (var element in fetchedData) {
      element.isFavorite = false;
    }
    searchList = fetchedData;
    dataFetched = true;
    emit(fetchedData);
  }

  filter(String searchKeyWord) {
    List<RecipeModel> res = [];
    if (searchKeyWord.isEmpty) {
      res = searchList;
    } else {
      res = searchList
          .where((element) =>
              element.name!.toLowerCase().contains(searchKeyWord.toLowerCase()))
          .toList();

      if (res.isEmpty) {}
    }
    emit(res);
  }
}
