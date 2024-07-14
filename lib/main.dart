import 'package:flutter/material.dart';
import 'package:votev/dashboard.dart';
import 'package:votev/firstscreen.dart';
import 'package:votev/screens/home_screen.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FirstScreen(),
    );
  }
}
