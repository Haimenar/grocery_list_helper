import 'package:flutter/material.dart';

class RecipeData with ChangeNotifier {
  List<Map<String, List<String>>> _recipeItems = [];

  List<Map<String, List<String>>> get recipeItems => _recipeItems;

  void addRecipe(String name, List<String> ingredients) {
    _recipeItems.add({name: ingredients});
    notifyListeners(); // Notify listeners of the change
  }

  void removeRecipe(int index) {
    _recipeItems.removeAt(index);
    notifyListeners(); // Notify listeners of the change
  }
}
