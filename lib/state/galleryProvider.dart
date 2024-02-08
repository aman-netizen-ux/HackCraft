import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

//This provider is for the gallery section.
class GalleryProvider with ChangeNotifier {
  late Uint8List selectedImageInBytes;

  final List<String> _galleryImages = [];
   String _logo ='';

  List<String> get galleryImages => _galleryImages;
  String get logo=>_logo;

   set logo(String value) {
    _logo = value;
    notifyListeners();
  }

  Future<void> pickImage() async {
    if (!kIsWeb) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selectedFile = File(image.path);
        var logger = Logger();
        logger.i(selectedFile);
      }
    } else if (kIsWeb) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image.readAsBytes();
        Uint8List webImage = f;
        String base64String = base64Encode(webImage);
        _galleryImages.add(base64String);
      } else {
        var logger = Logger();
        logger.i("Doesn't picked anything");
      }
    } else {
      var logger = Logger();
      logger.e("Something went wrong");
    }
    notifyListeners();
  }

  Future<void> deletePic(int index) async {
    _galleryImages.removeAt(index);
    notifyListeners();
  }

  Future<void> replaceImage(int index) async {
    if (!kIsWeb) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selectedFile = File(image.path);
        var logger = Logger();
        logger.i(selectedFile);
      }
    } else if (kIsWeb) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image.readAsBytes();
        Uint8List webImage = f;
        String base64String = base64Encode(webImage);
        _galleryImages[index]=base64String;
      } else {
        var logger = Logger();
        logger.i("Doesn't picked anything");
      }
    } else {
      var logger = Logger();
      logger.e("Something went wrong");
    }
    notifyListeners();
  }


Future<void> pickLogo() async {
    if (!kIsWeb) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selectedFile = File(image.path);
        var logger = Logger();
        logger.i(selectedFile);
      }
    } else if (kIsWeb) {
      final ImagePicker imagePicker = ImagePicker();
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image.readAsBytes();
        Uint8List webImage = f;
        String base64String = base64Encode(webImage);
        logo= base64String;
      } else {
        var logger = Logger();
        logger.i("Doesn't picked anything");
      }
    } else {
      var logger = Logger();
      logger.e("Something went wrong");
    }
    notifyListeners();
  }


}
