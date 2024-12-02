class Recipe {
  String id;
  String name;
  List <String> recipeCategories; // Each Recipe as multiple categories: breakfast, lunch, and dinner, gluten free, soup, bread, etcetera
  Recipe(
      {required this.id, required this.name, required this.recipeCategories});
}