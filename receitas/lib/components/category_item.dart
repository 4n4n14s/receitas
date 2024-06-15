import 'package:flutter/material.dart';
import 'package:receitas/models/category.dart';
import 'package:receitas/utius/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category, {super.key});

  void _selectCategory(BuildContext context) {
    /*//rota direta
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScree(category);
        },
      ),
    );)*/

    //rota pelo MaterialApp (route:)
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [category.color.withOpacity(.5), category.color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Text(category.title,
              style: Theme.of(context).textTheme.titleMedium)),
    );
  }
}
