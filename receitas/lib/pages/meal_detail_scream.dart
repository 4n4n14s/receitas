import 'package:flutter/material.dart';
import 'package:receitas/models/meal.dart';

// ignore: must_be_immutable
class MealDetailScream extends StatelessWidget {
  Function(Meal) onToggleFavorite;
  bool Function(Meal) isFavorite;
  MealDetailScream(this.onToggleFavorite, this.isFavorite, {super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        width: 350,
        height: 300,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              context,
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
