import 'package:dominos/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor:
            Color.fromRGBO(253, 173, 103, 1.0), // Drawer Color takes from here
        primarySwatch: Colors.orange, // Slider Color takes from here
        scaffoldBackgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
        primaryColor: Color.fromRGBO(253, 173, 103, 1.0),
      ),
      home: HomePage(),
    );
  }
}
