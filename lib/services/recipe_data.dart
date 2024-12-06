import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeData with ChangeNotifier {
  List<Recipe> _recipeItems = [];

  List<Recipe> get recipeItems => _recipeItems;

  void addRecipe(Recipe recipe) {
    _recipeItems.add(recipe);
    notifyListeners();
  }

  void removeRecipe(int index) {
    _recipeItems.removeAt(index);
    notifyListeners();
  }
}
