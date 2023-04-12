part of 'recipes_cubit.dart';

@immutable
abstract class RecipesState {}

class RecipesInitial extends RecipesState {}

class RecipesFetched extends RecipesState {
  final List<RecipeModel> recipes;

  RecipesFetched({required this.recipes});
}
