import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
//XFile image = await _picker.pickImage(...)
  final ImagePicker picker = ImagePicker();
  Future<String?> pickImage(ImageSource source) async {
    try {
      XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        return image.path;
      }
      return null;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
