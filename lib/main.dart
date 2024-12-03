import 'package:flutter/material.dart';
import 'grocery_list_screen.dart';
import 'recipe_list_screen.dart';

void main() {
  runApp(GroceryHelperMain());
}

class GroceryHelperMain extends StatelessWidget {
  GroceryHelperMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[600],
          elevation: 0.0,
          title: Text(
            "Grocery Helper",
            style: TextStyle(
              fontSize: 40,
              color: Colors.grey[100],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0, bottom: 8.0),
              child: IconButton.filled(
                icon: const Icon(Icons.settings),
                iconSize: 35,
                color: Colors.pink[600],
                tooltip: "Open Settings",
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.pink[200]),
                ),
              ),
            )          ],
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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GroceryListPreview(),
                      const SizedBox(height: 17.0),
                      RecipesPreview(),
                    ],
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

class GroceryListPreview extends StatelessWidget {
  GroceryListPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            // Use this context that has access to a Navigator
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroceryListScreen(),
              ),
            );
          },
          child: Card(
            elevation: 7.0,
            color: Colors.pink[100],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 400.0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "List",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[100],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}

class RecipesPreview extends StatelessWidget {
  RecipesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Use this context that has access to a Navigator
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeListScreen(),
          ),
        );
      },
      child: Card(
        elevation: 7.0,
        color: Colors.pink[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            height: 300.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Recipes",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[100],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}