import 'package:flutter/material.dart';
import 'package:receitas/components/meal_item.dart';
import 'package:receitas/models/meal.dart';

class FavoritiScreem extends StatelessWidget {
  const FavoritiScreem(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('nenhuma receita favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
