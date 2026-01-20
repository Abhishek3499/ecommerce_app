import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraUpload extends StatefulWidget {
  final Function(File image) onImageSelected;

  const CameraUpload({super.key, required this.onImageSelected});

  @override
  State<CameraUpload> createState() => _CameraUploadState();
}

class _CameraUploadState extends State<CameraUpload> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);
    if (picked != null) {
      final file = File(picked.path);
      setState(() => _image = file);
      widget.onImageSelected(file); // 🔥 pass image upward
    }
  }

  void showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showPicker,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 2,
          ),
          image: _image != null
              ? DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover, // 🔥 IMPORTANT
                )
              : null,
        ),
        child: _image == null
            ? Icon(Icons.camera_alt, color: Colors.blue, size: 30)
            : null,
      ),
    );
  }
}
