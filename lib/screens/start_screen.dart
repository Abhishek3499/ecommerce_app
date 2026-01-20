import 'package:ecommerceapp/screens/auth/Login_screen.dart';
import 'package:ecommerceapp/screens/auth/create%20account_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/start_screen_logo/start_screen_logo.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              SizedBox(height: 24),
              Text(
                "Shoppe",
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Beautiful eCommerce UI Kit\nfor your online store",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF202020),
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                height: 72,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Createaccount_Screen(),
                      ),
                    );
                  },
                  child: Text(
                    "Let's get started",
                    style: TextStyle(
                      color: Color(0xFFF3F3F3),
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I already have an account",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(
                            email: "guest@shoppe.com",
                            image: null,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFF004CFF),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
