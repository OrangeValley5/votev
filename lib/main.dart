import 'package:flutter/material.dart';
import 'package:votev/dashboard.dart';
import 'package:votev/etwall.dart';
import 'package:votev/faqs.dart';
import 'package:votev/firstscreen.dart';
import 'package:votev/home.dart';
import 'package:votev/onboard.dart';
import 'package:votev/recovery.dart';
import 'package:votev/refs.dart';
import 'package:votev/remove_et.dart';
import 'package:votev/reuse.dart';
import 'package:votev/screens/home_screen.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:votev/signup.dart';
import 'package:votev/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:js' as js;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDGJiobqeRwZAIY6TRuw7yPHxi7eB08QA0",
          appId: "1:1032110334127:web:e566710f12aa6fc8fc345a",
          messagingSenderId: "1032110334127",
          projectId: "votexmini"));
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
