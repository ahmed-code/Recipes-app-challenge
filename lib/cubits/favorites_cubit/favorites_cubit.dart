import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:recipes/model/recipe_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<List<RecipeModel>> {
  FavoritesCubit() : super([]);
  Box box = Hive.box("favoritesBox");

  getFavorite() {
    if (box.get("favorites") == null) {
      emit([]);
    } else {
      List list = box.get("favorites");
      List<RecipeModel> temp = [];
      for (var element in list) {
        RecipeModel model = element;
        temp.add(model);
      }
      emit(temp);
    }
  }

  bool isFavorite(RecipeModel recipeModel) {
    if (box.get("favorites") == null) {
      return false;
    } else {
      List list = box.get("favorites");
      for (var element in list) {
        RecipeModel model = element;
        if (model.id == recipeModel.id) {
          return true;
        }
      }
    }
    return false;
  }

  addToFavorite(RecipeModel recipeModel) {
    if (box.get("favorites") == null) {
      box.put("favorites", [recipeModel]);
    } else {
      List favorites = box.get("favorites");
      favorites.add(recipeModel);
      box.put("favorites", favorites);
    }
    getFavorite();
  }

  deleteFromFavorite(RecipeModel recipeModel) {
    if (box.get("favorites") == null) {
      emit([]);
    } else {
      List list = box.get("favorites");
      List<RecipeModel> temp = [];
      for (var element in list) {
        RecipeModel model = element;
        if (model.id != recipeModel.id) {
          temp.add(model);
        }
      }
      box.put("favorites", temp);
      emit(temp);
    }
  }
}
