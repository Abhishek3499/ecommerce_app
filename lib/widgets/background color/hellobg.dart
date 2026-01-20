import 'package:flutter/material.dart';

class Hellobg extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Stack(
      children: [
        // 🔵 TOP IMAGE
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/hello_card/bubble 01.png",
            fit: BoxFit.cover,
            height: 280,
          ),
        ),

        // 🔵 BOTTOM LEFT IMAGE
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            "assets/hello_card/bubble 02.png",
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
