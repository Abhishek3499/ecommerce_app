import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  double _sx(BuildContext context) => MediaQuery.of(context).size.width / 390;
  double _sy(BuildContext context) => MediaQuery.of(context).size.height / 844;

  @override
  Widget build(BuildContext context) {
    final sx = _sx(context);
    final sy = _sy(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // bubble_2: light blue base (bottom layer)
        Positioned(
          top: -171.67 * sy,
          left: -136.68 * sx,
          width: 373.53 * sx,
          height: 442.65 * sy,
          child: Transform.rotate(
            angle: -158 * (math.pi / 180),
            child: Image.asset(
              'assets/login_screen/bubble_2.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // bubble_01: dark blue overlaying bubble_2
        Positioned(
          top: -171 * sy,
          left: -158.44 * sx,
          width: 402.87 * sx,
          height: 442.65 * sy,
          child: Transform.rotate(
            angle: 0 * (math.pi / 180),
            child: Image.asset(
              'assets/login_screen/bubble_01.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // bubble_3: small blue on right side
        Positioned(
          top: 239.24 * sy,
          left: 281.77 * sx,
          width: 137.56 * sx,
          height: 151.14 * sy,
          child: Transform.rotate(
            angle: 156 * (math.pi / 180),
            child: Image.asset(
              'assets/login_screen/bubble_3.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // bubble_4: light circle behind form (top aligned per Figma)
        Positioned(
          top: 449.48 * sy,
          left: 87.19 * sx,
          width: 373.53 * sx,
          height: 442.65 * sy,
          child: Transform.rotate(
            angle: -108 * (math.pi / 180),
            child: Image.asset(
              'assets/login_screen/bubble_4.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
