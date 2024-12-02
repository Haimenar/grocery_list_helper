import 'store.dart';

class ShoppingItem {
  String id;
  String name;
  List stores; // When in shopping mode, each item will be sorted by store and section
  String storeSection;
  bool isChecked; // Whether the item is checked off
  ShoppingItem({required this.id, required this.name, required this.stores, required this.storeSection, this.isChecked = false}) {
    // TODO: implement ShoppingItem
    throw UnimplementedError();
  }
}