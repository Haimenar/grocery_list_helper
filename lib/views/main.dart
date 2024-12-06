import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'grocery_list_screen.dart';
import '../models/recipe.dart';
import '../models/grocery_item.dart';
import 'recipe_list_screen.dart';
import '../services/grocery_data.dart';
import '../services/recipe_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GroceryData()), // Provide GroceryData
        ChangeNotifierProvider(create: (context) => RecipeData()),  // Provide RecipeData
      ],
      child: GroceryHelperMain(),
    ),
  );
}

class GroceryHelperMain extends StatefulWidget {
  @override
  _GroceryHelperMainState createState() => _GroceryHelperMainState();
}

class _GroceryHelperMainState extends State<GroceryHelperMain> {
  int _currentIndex = 1;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      GroceryListScreen(),
      GroceryHelperScreen(
        onListTap: () => setState(() => _currentIndex = 0),
        onRecipesTap: () => setState(() => _currentIndex = 2),
      ),
      RecipeListScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[600],
          elevation: 0.0,
          title: Text(
            "Grocery Helper",
            style: TextStyle(fontSize: 40, color: Colors.grey[100]),
          ),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.pink[300],
          selectedItemColor: Colors.pink[700],
          unselectedItemColor: Colors.grey[100],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Recipes",
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryHelperScreen extends StatelessWidget {
  final Function onListTap;
  final Function onRecipesTap;

  GroceryHelperScreen({required this.onListTap, required this.onRecipesTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink[500]!, Colors.pink[200]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GroceryListPreview(onPreviewTap: onListTap),
                const SizedBox(height: 17.0),
                RecipesPreview(onPreviewTap: onRecipesTap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GroceryListPreview extends StatelessWidget {
  final Function onPreviewTap;

  GroceryListPreview({required this.onPreviewTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPreviewTap(),
      child: Card(
        elevation: 7.0,
        color: Colors.pink[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            height: 400.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "List",
                  style: TextStyle(fontSize: 20, color: Colors.grey[100]),
                ),
                Expanded(
                  child: Consumer<GroceryData>(
                    builder: (context, groceryData, child) {
                      return ListView.builder(
                        itemCount: groceryData.groceryItems.length,
                        itemBuilder: (context, index) {
                          GroceryItem item = groceryData.groceryItems[index];

                          return Card(
                            color: Colors.pink[200],
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                              title: Text(
                                item.name,
                                style: TextStyle(color: Colors.grey[100], fontSize: 16),
                              ),
                              subtitle: Text(
                                "Store: ${item.stores.map((store) => store.name).join(", ")}\nSection: ${item.storeSection}",
                                style: TextStyle(color: Colors.grey[300], fontSize: 12),
                              ),
                              trailing: IconButton(
                                icon: Icon(item.isChecked ? Icons.check_box : Icons.check_box_outline_blank),
                                color: Colors.grey[200],
                                onPressed: () {
                                  groceryData.toggleChecked(index); // Toggle the checked status
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class RecipesPreview extends StatelessWidget {
  final Function onPreviewTap;
  RecipesPreview({required this.onPreviewTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPreviewTap(),
      child: Card(
        elevation: 7.0,
        color: Colors.pink[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            height: 240.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recipes",
                  style: TextStyle(fontSize: 20, color: Colors.grey[100]),
                ),
                Expanded(
                  child: Consumer<RecipeData>(
                    builder: (context, recipeData, child) {
                      return ListView.builder(
                        itemCount: recipeData.recipeItems.length,
                        itemBuilder: (context, index) {
                          Recipe recipe = recipeData.recipeItems[index];

                          return ListTile(
                            title: Text(
                              recipe.name,
                              style: TextStyle(color: Colors.grey[100]),
                            ),
                            subtitle: Text(
                              "Ingredients: ${recipe.ingredients.join(", ")}\nCategories: ${recipe.recipeCategories.join(", ")}",
                              style: TextStyle(color: Colors.grey[100]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





