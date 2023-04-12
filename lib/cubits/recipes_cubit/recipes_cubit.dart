import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes/model/recipe_model.dart';

import '../../model/recipe_api.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<List<RecipeModel>> {
  RecipesCubit() : super([]);

  getData() async {
    List result = await RecipeApi().getRecipes();

    emit((result).map((data) => RecipeModel.fromJson(data)).toList());
  }
}
