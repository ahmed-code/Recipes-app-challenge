import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/cubits/recipes_cubit/recipes_cubit.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.white,
      child: TextField(
        onChanged: (value) {
          BlocProvider.of<RecipesCubit>(context).filter(value);
        },
        decoration: InputDecoration(
          hintText: "search recipes",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
        // onSubmitted: (value) {},
      ),
    );
  }
}
