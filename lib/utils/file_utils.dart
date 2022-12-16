import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileUtils {
  static Future<File?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        // maxWidth: 200,
        // maxHeight: 200,
        // imageQuality: 80,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
