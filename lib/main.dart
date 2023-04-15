import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:recipes/cubits/recipes_cubit/recipes_cubit.dart';
import 'package:recipes/view/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late Box box;
void main() async {
  await Hive.initFlutter();

  box = await Hive.openBox("favorites");
  // var box = await Hive.openBox("favorites");
  // await box.put("name", "nnnnn");
  // var name = await box.get("favorites");
  // print(name);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipesCubit()..getData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
