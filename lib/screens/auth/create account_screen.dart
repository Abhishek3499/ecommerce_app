import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerceapp/screens/auth/Login_screen.dart';
import 'package:ecommerceapp/widgets/background%20color/background_shapes.dart';
import 'package:ecommerceapp/widgets/camera_upload..dart';
import 'package:ecommerceapp/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';

class Createaccount_Screen extends StatefulWidget {
  @override
  State<Createaccount_Screen> createState() => _Createaccount_ScreenState();
}

class _Createaccount_ScreenState extends State<Createaccount_Screen> {
  File? profileImage;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundShapes(),

            // 🔽 SCROLL CONTENT
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),

                    Text(
                      "Create\nAccount",
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w700,
                        fontSize: 52,
                      ),
                    ),

                    const SizedBox(
                      height: 180,
                    ), // 🔥 IMPORTANT (avatar ke liye space)

                    CustomTextfield(hint: "Email", controller: emailController),
                    const SizedBox(height: 16),

                    CustomTextfield(hint: "Password", isPassword: true),
                    const SizedBox(height: 30),

                    CustomTextfield(
                      hint: "your number",
                      prefix: CountryCodePicker(
                        initialSelection: 'IN',
                        favorite: const ['+91', '+1'],
                      ),
                    ),

                    const SizedBox(height: 30),

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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginScreen(
                                email: emailController.text,
                                image: profileImage,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Color(0xFFF3F3F3),
                            fontSize: 22,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔥 CAMERA UPLOAD (LAST = CLICKABLE)
            Positioned(
              top: 310,
              left: 20,
              child: CameraUpload(
                onImageSelected: (File image) {
                  setState(() {
                    profileImage = image;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
