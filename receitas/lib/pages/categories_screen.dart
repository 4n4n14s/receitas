import 'package:flutter/material.dart';
import 'package:receitas/components/category_item.dart';
import 'package:receitas/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // o maximo que vai estender para articionar os itens
        maxCrossAxisExtent: 200,
        //proporção de cada elemento dentro do grid view
        childAspectRatio: 3 / 2,
        //espaçamento eixo cruzado
        crossAxisSpacing: 20,
        //espaçamento
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((e) {
        return CategoryItem(e);
      }).toList(),
    );
  }
}
