class Recipe {
  String id;
  String name;
  List<String> ingredients;  // List of ingredients for the recipe
  List<String> recipeCategories;  // Categories for the recipe, e.g., breakfast, gluten-free, etc.

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.recipeCategories,
  });
}
