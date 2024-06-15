// ignore_for_file: public_member_api_docs, sort_constructors_first
class Setting {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;
  Setting({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}
