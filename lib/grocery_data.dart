import 'package:flutter/material.dart';
import 'models/grocery_item.dart';
import 'models/store.dart';

class GroceryData with ChangeNotifier {
  List<GroceryItem> _groceryItems = [];

  List<GroceryItem> get groceryItems => _groceryItems;


  void addGroceryItem(String name, List<Store> stores, String storeSection) {
    GroceryItem newItem = GroceryItem(
      id: DateTime.now().toString(),
      name: name,
      stores: stores,
      storeSection: storeSection,
    );
    _groceryItems.add(newItem);
    notifyListeners();
  }

  void removeGroceryItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void toggleChecked(int index) {
    _groceryItems[index].isChecked = !_groceryItems[index].isChecked;
    notifyListeners(); // Notify listeners of the change
  }
}
