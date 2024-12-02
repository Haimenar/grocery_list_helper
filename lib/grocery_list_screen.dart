import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grocery List",
          style: TextStyle(
            fontSize: 40,
            color: Colors.grey[100],
          ),
        ),
         actions: const <Widget> [
           // IconButton(
           //   icon:(Icons.search),
           //   onPressed: () {
           //     //Implement search bar
           //   },
           // )
         ],
      ),
      body: ShoppingListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        //Implement Later
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
                 //Implement Adding the Item to the List
                 Navigator.pop(context);
               },
               child: const Text("Add Item"),
           ),
         ],
       );

     },
   );
  }

class ShoppingListBody extends StatelessWidget{
  final List<String> mockItems = [
    "Milk",
    "Eggs",
    "Sugar",
    "Apples",
    "Carrots",
  ];

  ShoppingListBody({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ListView.builder(
        itemCount: mockItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mockItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                //Implement Deleting Items
              },
            )
          );
        }
      ),
    );
  }
}