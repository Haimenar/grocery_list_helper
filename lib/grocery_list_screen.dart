import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        title: Text(
          "Grocery List",
          style: TextStyle(
            fontSize: 40,
            color: Colors.grey[100],
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[100],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink[600]!, // Dark pink at the top
              Colors.pink[200]!,  // Lighter pink at the bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ShoppingListBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement Later
        },
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
              // Implement Adding the Item to the List
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
  final List<String> mockItems = [
    "Milk",
    "Eggs",
    "Sugar",
    "Apples",
    "Carrots",
  ];

  ShoppingListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ListView.builder(
        itemCount: mockItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.pink[200],
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 4.0), // Margin between cards
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding inside the card
              title: Text(
                mockItems[index],
                style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 16,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.grey[200],
                onPressed: () {
                  // Implement Deleting Items
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
