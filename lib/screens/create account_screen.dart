import 'package:ecommerceapp/widgets/background_shapes.dart';
import 'package:flutter/material.dart';

class Createaccount_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundShapes(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text("create\naccount"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
