import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../services/recipe_data.dart';

class RecipeListScreen extends StatefulWidget {
  RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
  }

  void _updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeData>(
      builder: (context, recipeData, child) {
        // Filter the recipes based on search query
        List<Recipe> filteredRecipes = recipeData.recipeItems.where((recipe) {
          return recipe.name.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();

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
            child: Column(
              children: [
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
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredRecipes.length,
                    itemBuilder: (context, index) {
                      Recipe recipe = filteredRecipes[index];
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
                            recipe.name,
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            "Ingredients: ${recipe.ingredients.join(", ")}\nCategories: ${recipe.recipeCategories.join(", ")}",
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 12,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.grey[200],
                            onPressed: () {
                              recipeData.removeRecipe(index);
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
              _showAddRecipeDialog(context);
            },
            tooltip: "Add New Recipe",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    TextEditingController recipeNameController = TextEditingController();
    TextEditingController ingredientsController = TextEditingController();
    TextEditingController categoriesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Recipe"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: recipeNameController,
                decoration: const InputDecoration(hintText: "Recipe name"),
              ),
              TextField(
                controller: ingredientsController,
                decoration: const InputDecoration(hintText: "Comma separated ingredients"),
              ),
              TextField(
                controller: categoriesController,
                decoration: const InputDecoration(hintText: "Comma separated categories"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (recipeNameController.text.isNotEmpty &&
                    ingredientsController.text.isNotEmpty &&
                    categoriesController.text.isNotEmpty) {
                  List<String> ingredients = ingredientsController.text.split(",");
                  List<String> categories = categoriesController.text.split(",");

                  Recipe newRecipe = Recipe(
                    id: DateTime.now().toString(), // Unique ID (could be UUID or something else)
                    name: recipeNameController.text,
                    ingredients: ingredients,
                    recipeCategories: categories,
                  );

                  Provider.of<RecipeData>(context, listen: false).addRecipe(newRecipe);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add Recipe"),
            ),
          ],
        );
      },
    );
  }
}
