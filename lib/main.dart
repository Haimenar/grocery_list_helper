import 'package:flutter/material.dart';

void main() {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          elevation: 0,
          title: Text(
            "Grocery Helper",
            style: TextStyle(
              fontSize: 40,
              color: Colors.grey[100],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton.filled(
                icon: const Icon(Icons.settings),
                iconSize: 35,
                color: Colors.pink[300],
                tooltip: "Open Settings",
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink[100]),
                ),
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink[400]!, Colors.pink[200]!], // Gradient colors
              begin: Alignment.topCenter, // Start at the top
              end: Alignment.bottomCenter, // End at the bottom
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        color: Colors.pink[100],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 400.0,
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
                      SizedBox(height: 17.0),
                      Card(
                        color: Colors.pink[100],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 300.0,
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
