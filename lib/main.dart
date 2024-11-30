import 'package:flutter/material.dart';

void main() {
  runApp(
      ListApp()
  );
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.pink[100],
        appBar: AppBar(
            backgroundColor: Colors.pink[300],
            title: Text("Grocery Helper",
            style: TextStyle(
              fontSize: 40,
              color: Colors.grey[100],
            ),
          ),
          actions: <Widget> [
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
                )
              ),
            )
          ]

        ),
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 17, horizontal: 17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Card(
                        color: Colors.pink[200],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 400.0,
                            child: Text("List",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey[100],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 17.0
                      ),
                      Card(
                        color: Colors.pink[200],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 300.0,
                            child: Text("Recipes",
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

              ]
          ),

        ),
      ),
    );
  }
}