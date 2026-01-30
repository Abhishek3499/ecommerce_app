import 'package:ecommerceapp/models/user_model.dart';
import 'package:ecommerceapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

/// Simple wrapper to create HomeScreen with a placeholder user when needed.
class HomeTab extends StatelessWidget {
  final UserModel user;

  const HomeTab({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(user: user);
  }
}

