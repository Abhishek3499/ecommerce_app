import 'package:ecommerceapp/screens/create%20account_screen.dart';
import 'package:ecommerceapp/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppe UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      home: Createaccount_Screen(),
    );
  }
}
