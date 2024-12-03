import 'package:flutter/material.dart';
import 'grocery_list_screen.dart';
import 'recipe_list_screen.dart';

void main() {
  runApp(GroceryHelperMain());
}

class GroceryHelperMain extends StatefulWidget {
  @override
  _GroceryHelperMainState createState() => _GroceryHelperMainState();
}

class _GroceryHelperMainState extends State<GroceryHelperMain> {
  int _currentIndex = 1;
  final List<Widget> _screens = [
    GroceryListScreen(),
    GroceryHelperScreen(),
    RecipeListScreen(),
  ];

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
          backgroundColor: Colors.pink[100],
          selectedItemColor: Colors.pink[600],
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
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GroceryListPreview(),
                  const SizedBox(height: 17.0),
                  RecipesPreview(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryListPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GroceryListScreen()),
      ),
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
                  style: TextStyle(fontSize: 30, color: Colors.grey[100]),
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

class RecipesPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipeListScreen()),
      ),
      child: Card(
        elevation: 7.0,
        color: Colors.pink[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            height: 240.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Recipes",
                  style: TextStyle(fontSize: 30, color: Colors.grey[100]),
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
