import 'package:flutter/material.dart';
import 'photo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green, accentColor: Colors.green[800]),
      home: PhotoScreen(),
    );
  }
}
