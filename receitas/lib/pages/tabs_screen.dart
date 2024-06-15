import 'package:flutter/material.dart';
import 'package:receitas/components/main_drawer.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/pages/categories_screen.dart';
import 'package:receitas/pages/favoriti_screem.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIdex = 0;
   List<Map<String, dynamic>>? _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'categoria', 'screen': const CategoriesScreen()},
      {'title': 'favorito', 'screen': FavoritiScreem(widget.favoriteMeals)}
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(_screens![_selectedScreenIdex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _screens![_selectedScreenIdex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).canvasColor,
          currentIndex: _selectedScreenIdex,
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'favoritos',
            )
          ],
        ),
      ),
    );
  }
}
