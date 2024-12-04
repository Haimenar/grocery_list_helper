import 'package:flutter/material.dart';

class GroceryData with ChangeNotifier {
  List<String> groceryItems = ["Milk", "Eggs", "Sugar"];
  List<String> recipes = ["Apple Pie", "Carrot Soup"];

  void addGroceryItem(String item) {
    groceryItems.add(item);
    notifyListeners();
  }

  void addRecipe(String recipe) {
    recipes.add(recipe);
    notifyListeners();
  }

  void removeGroceryItem(int index) {
    groceryItems.removeAt(index);
    notifyListeners();
  }

  void removeRecipe(int index) {
    recipes.removeAt(index);
    notifyListeners();
  }
}
