import 'package:flutter/material.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/models/setting.dart';
import 'package:receitas/pages/categories_meals_scree.dart';
import 'package:receitas/pages/meal_detail_scream.dart';
import 'package:receitas/pages/settings_screen.dart';
import 'package:receitas/pages/tabs_screen.dart';
import 'package:receitas/utius/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Setting settings = Setting();
  List<Meal> _avaliableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _fiterMeals(Setting setting) {
    setState(() {
      settings = setting;

      _avaliableMeals = dummyMeals.where((meal) {
        final filterGlutten = setting.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = setting.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = setting.isVegan && !meal.isVegan;
        final filterVegetarian = setting.isVegetarian && !meal.isVegetarian;

        return !filterVegetarian &&
            !filterVegan &&
            !filterLactose &&
            !filterGlutten;
      }).toList();
    });
  }

  void _toggleFavorites(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.amber[50],
          primaryColor: Colors.orange,
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScree(_avaliableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScream(_toggleFavorites , isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_fiterMeals, settings),
      },
    );
  }
}
