import 'package:flutter/material.dart';
import 'package:oriens/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oriens',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomeScreen(),
    );
  }
}
