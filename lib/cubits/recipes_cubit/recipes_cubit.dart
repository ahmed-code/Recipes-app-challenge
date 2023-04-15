import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes/model/recipe_model.dart';

import '../../model/recipe_api.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<List<RecipeModel>> {
  RecipesCubit() : super([]);

  List<RecipeModel> searchList = [];

  getData() async {
    List result = await RecipeApi().getRecipes();

    List<RecipeModel> fetchedData =
        (result).map((data) => RecipeModel.fromJson(data)).toList();

    fetchedData[0].isFavorite = true;
    for (var element in fetchedData) {
      element.isFavorite = false;
    }
    searchList = fetchedData;

    emit(fetchedData);
  }

  filter(String searchKeyWord) {
    print("_________$searchKeyWord __________");
    List<RecipeModel> res = [];
    if (searchKeyWord.isEmpty) {
      res = searchList;
    } else {
      res = searchList
          .where((element) =>
              element.name!.toLowerCase().contains(searchKeyWord.toLowerCase()))
          .toList();
    }
    emit(res);
  }
}
