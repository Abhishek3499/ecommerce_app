import 'package:flutter/material.dart';

class BackgroundShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          left: -100,
          child: Image.asset("assets/second_screen_logo/Bubbles.png"),
        ),
      ],
    );
  }
}
