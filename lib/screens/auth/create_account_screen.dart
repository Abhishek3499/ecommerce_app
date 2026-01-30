import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerceapp/screens/auth/login_screen.dart';

import 'package:ecommerceapp/widgets/common/background_shapes.dart';
import 'package:ecommerceapp/widgets/common/camera_upload_widget.dart';

import 'package:ecommerceapp/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File? profileImage;
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundShapes(),
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(bottom: bottomInset),
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
                    const SizedBox(height: 180),
                    CustomTextfield(hint: "Email", controller: emailController),
                    const SizedBox(height: 16),
                    const CustomTextfield(hint: "Password", isPassword: true),
                    const SizedBox(height: 30),
                    const CustomTextfield(
                      hint: "your number",
                      prefix: CountryCodePicker(
                        initialSelection: 'IN',
                        favorite: ['+91', '+1'],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004CFF),
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
                        child: const Text(
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
            Positioned(
              top: 310,
              left: 20,
              child: CameraUploadWidget(
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
