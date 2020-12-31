import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile1/views/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Tim Basket',
      home: HomeScreen(),
    );
  }
}
