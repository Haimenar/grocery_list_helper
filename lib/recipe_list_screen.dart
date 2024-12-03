import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final List<Map<String, List<String>>> mockRecipes = [
    {"Pancakes": ["Flour", "Milk", "Eggs", "Butter", "Sugar"]},
    {"Brownies": ["Chocolate", "Butter", "Sugar", "Eggs", "Flour"]},
    {"Chicken Noodle Soup": ["Chicken", "Noodles", "Carrots", "Celery", "Broth"]},
    {"Sourdough Bread": ["Flour", "Water", "Salt", "Starter"]},
    {"Pasta": ["Pasta", "Tomato Sauce", "Cheese"]},
  ];

  String searchQuery = "";
  List<Map<String, List<String>>> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes = mockRecipes; // Initialize with all recipes
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredRecipes = mockRecipes
          .where((recipe) =>
          recipe.keys.first.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        title: Text(
          "Recipes",
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
              Colors.pink[500]!,
              Colors.pink[200]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: "Search recipes...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
            // Recipe List
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  String recipeName = filteredRecipes[index].keys.first;
                  List<String> ingredients = filteredRecipes[index][recipeName]!;

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
                        recipeName,
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "Ingredients: ${ingredients.join(", ")}",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.grey[200],
                        onPressed: () {
                          // Implement interaction for this recipe
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement later
        },
        tooltip: "Add New Recipe",
        child: const Icon(Icons.add),
      ),
    );
  }
}
