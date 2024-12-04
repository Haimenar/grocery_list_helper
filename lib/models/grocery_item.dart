import 'store.dart';

class GroceryItem {
  String id;
  String name;
  List<Store> stores;
  String storeSection;
  bool isChecked;

  GroceryItem({
    required this.id,
    required this.name,
    required this.stores,
    required this.storeSection,
    this.isChecked = false,
  });
}

