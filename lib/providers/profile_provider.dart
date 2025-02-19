import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  File? get profileImage => _profileImage;

  // Pick Image from Gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Pick Image from Camera
  Future<void> captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  final Map<String, String> _selectedValues = {}; // Stores dropdown selections

  // Getter for dropdown value
  String getSelectedValue(String key) {
    return _selectedValues[key] ?? "Select"; // Default value
  }

  // Update dropdown value
  void updateValue(String key, String newValue) {
    _selectedValues[key] = newValue;
    notifyListeners();
  }
}
