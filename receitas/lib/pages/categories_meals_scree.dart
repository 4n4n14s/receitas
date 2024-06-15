import 'package:flutter/material.dart';
import 'package:receitas/components/meal_item.dart';
import 'package:receitas/models/meal.dart';
import '../models/category.dart';

class CategoriesMealsScree extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScree(this.meals, {super.key});
  @override
  Widget build(BuildContext context) {
    //recebe asinformaes o argumento
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
