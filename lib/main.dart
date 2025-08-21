import 'package:flutter/material.dart';
import 'screens/choose_language_screen.dart';  // ✅ only import this file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseLanguageScreen(), // ✅ class name from other file
    );
  }
}