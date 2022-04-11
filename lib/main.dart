import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _colors = [
    Colors.black,
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

  var _colorsName = [
    "Black",
    "Blue",
    "Orange",
    "Red",
    "Green",
    "Yellow",
  ];

  int _indexColor = 0;

  void changeColor (int index)
  {
    setState(() {
      switch (index)
      {
        case 0:
          _indexColor = 0;
          break;
        case 1:
          _indexColor = 1;
          break;
        case 2:
          _indexColor = 2;
          break;
        case 3:
          _indexColor = 3;
          break;
        case 4:
          _indexColor = 4;
          break;
        case 5:
          _indexColor = 5;
          break;
      }
      index = _indexColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => debugPrint("Este botón no hace nada"),
              icon: const Icon(Icons.supervised_user_circle),
              splashColor: Colors.red,
              iconSize: 40.0
          )
        ],
      ),
      drawer: Drawer(
        child:
        ListView(
          children: const [
            DrawerHeader(child:
            Text('Drawer header'),
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
            )
          ],
        ),
      ),
      body:
        Column(
          children: [
            ListView.builder(
              itemCount: _colorsName.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext, int index)
              {
                final name = _colorsName[index];
                var color = _colors[index];
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: color
                  ),
                  onPressed: () => changeColor(index),
                  child: Text(name),
                );
              },
            ),
            Center(
              child: Text(
                'Hello World',
                style: TextStyle(
                  color: _colors[_indexColor]
                ),
              )
            ),
          ],
        ),
    );
  }
}
