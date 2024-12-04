import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'grocery_data.dart';
import 'models/grocery_item.dart';
import 'models/store.dart';

class GroceryListScreen extends StatelessWidget {
  GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink[500]!,
              Colors.pink[200]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ShoppingListBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddGroceryItemDialog(context),
        tooltip: "Add Item",
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showAddGroceryItemDialog(BuildContext context) {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController storeSectionController = TextEditingController();
  List<Store> selectedStores = []; // List of stores the user selects

  // Show dialog for adding a new grocery item
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Add Grocery Item"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: itemNameController,
              decoration: const InputDecoration(hintText: "Item name"),
            ),
            TextField(
              controller: storeSectionController,
              decoration: const InputDecoration(hintText: "Store section"),
            ),
            // Add Store selection logic here
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Close dialog
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (itemNameController.text.isNotEmpty &&
                  storeSectionController.text.isNotEmpty) {
                // Use the data to create a new GroceryItem
                GroceryItem newItem = GroceryItem(
                  id: DateTime.now().toString(),
                  name: itemNameController.text,
                  stores: selectedStores,
                  storeSection: storeSectionController.text,
                );

                Provider.of<GroceryData>(context, listen: false).addGroceryItem(
                  newItem.name,
                  newItem.stores,
                  newItem.storeSection,
                );

                Navigator.pop(context);
              }
            },
            child: const Text("Add Item"),
          ),
        ],
      );
    },
  );
}

class ShoppingListBody extends StatelessWidget {
  ShoppingListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Consumer<GroceryData>(
        builder: (context, groceryData, child) {
          return ListView.builder(
            itemCount: groceryData.groceryItems.length,
            itemBuilder: (context, index) {
              GroceryItem groceryItem = groceryData.groceryItems[index]; // Get the GroceryItem object

              return Card(
                color: Colors.pink[200],
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  title: Text(
                    groceryItem.name, // Use the name property of the GroceryItem
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "Store Section: ${groceryItem.storeSection}", // Display the store section
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.grey[200],
                    onPressed: () {
                      groceryData.removeGroceryItem(index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
