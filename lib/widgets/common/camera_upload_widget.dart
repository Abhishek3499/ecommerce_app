import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Widget for uploading profile picture via camera or gallery
/// Displays a circular button with camera icon that opens image picker
class CameraUploadWidget extends StatefulWidget {
  final Function(File image) onImageSelected;

  const CameraUploadWidget({super.key, required this.onImageSelected});

  @override
  State<CameraUploadWidget> createState() => _CameraUploadWidgetState();
}

class _CameraUploadWidgetState extends State<CameraUploadWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(source: source);
    if (picked != null) {
      final file = File(picked.path);
      setState(() => _image = file);
      widget.onImageSelected(file);
    }
  }

  void _showImagePickerModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
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
      onTap: _showImagePickerModal,
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
              ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
              : null,
        ),
        child: _image == null
            ? const Icon(Icons.camera_alt, color: Colors.blue, size: 30)
            : null,
      ),
    );
  }
}
