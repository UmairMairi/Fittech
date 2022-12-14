import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyDataProvider extends ChangeNotifier {
  MyDataProvider();

  File? imageFile;
  String name = "Angle";
  String lastName = "Castañeda";
  String email = "ejemplo@gmail.com";
  String gender = "Hombre";

  Future<File?> pickImageFromGallery({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 200,
        maxHeight: 200,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        imageFile =  File(pickedFile.path);
        notifyListeners();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  setName({required String val}){
    name = val;
    notifyListeners();
  }
  setLastName({required String val}){
    lastName = val;
    notifyListeners();
  }
  setEmail({required String val}){
    email = val;
    notifyListeners();
  }
  setGender({required String val}){
    gender = val;
    notifyListeners();
  }
}
