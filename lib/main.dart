import 'package:flutter/material.dart';
import 'package:stream_builder/home.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch:
            Colors.green, 
      ),
      title: 'StreamBuilder Example',
      home: NumberStreamPage(),
    );
  }
}

