import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../view/widget/snack_bar.dart';

class ImagePickerController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage(BuildContext context) async {
    try {
      final picker = ImagePicker();
      final XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        final File file = File(xFile.path); // Convert XFile to File
        selectedImage.value = file;
      } else {
        snackBarCustom(context, 'No image selected.', 'Close',
            () => Navigator.of(context).pop());
      }
    } catch (e) {
      snackBarCustom(
          context, 'Error: $e', 'Close', () => Navigator.of(context).pop());
    }
  }
}
