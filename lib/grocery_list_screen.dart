import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'grocery_data.dart';

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
        onPressed: () => _showAddItemDialog(context), // Show Add Item Dialog
        tooltip: "Add Item",
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showAddItemDialog(BuildContext context) {
  TextEditingController itemController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Add Item"),
        content: TextField(
          controller: itemController,
          decoration: const InputDecoration(hintText: "Enter item name"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (itemController.text.isNotEmpty) {
                Provider.of<GroceryData>(context, listen: false)
                    .addGroceryItem(itemController.text);
              }
              Navigator.pop(context);
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
              return Card(
                color: Colors.pink[200],
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0),
                  title: Text(
                    groceryData.groceryItems[index],
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 16,
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
