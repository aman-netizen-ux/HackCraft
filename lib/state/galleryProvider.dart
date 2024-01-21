import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

//This provider is for the gallery section.
class GalleryProvider with ChangeNotifier{
late Uint8List selectedImageInBytes;
  //The demo list is there to show the images in the gallery.
  // final List<String> _galleryImages = [
  //   'assets/images/defaultTemplate/GalleryImage.png',
  //   'assets/images/defaultTemplate/GalleryImage.png',
  //   // 'assets/images/defaultTemplate/GalleryImage.png',
  //   // 'assets/images/defaultTemplate/GalleryImage.png',
  //   // 'assets/images/defaultTemplate/GalleryImage.png'
  // ];

  final List<String> _galleryImages = [
    'default','default'
    // 'assets/images/defaultTemplate/GalleryImage.png',
    // 'assets/images/defaultTemplate/GalleryImage.png',
    // 'assets/images/defaultTemplate/GalleryImage.png',
    // 'assets/images/defaultTemplate/GalleryImage.png',
    // 'assets/images/defaultTemplate/GalleryImage.png'
  ];

  List<String> get galleryImages => _galleryImages;

  // void setGalleryImages(String imagePath){
  //   _galleryImages = imagePath;
  // }

  selectFile(bool fileFrom)async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if(filePickerResult!= null){
    //   String selectedFile= filePickerResult.files.first.name;
    //   selectedImageInBytes=filePickerResult.files.first.bytes!;
    //   String base64String = base64Encode(selectedImageInBytes);
    //   selectedFile.isEmpty?
    //   _galleryImages.add('default')
    //   :_galleryImages.add(base64String)
    //   ;
    // }

    if (result != null) {
  Uint8List fileBytes = result.files.first.bytes!;
  String fileName = result.files.first.name;
  print(fileName);
  
}
    notifyListeners();

  }



  Future<void> pickImage()async {
    if(!kIsWeb){

      final ImagePicker _imagePicker= ImagePicker();
      XFile? image= await _imagePicker.pickImage(source: ImageSource.gallery);

      if(image!=null){
       var selectedFile= File(image.path);
       print(selectedFile);
      }

    }
    
    else if(kIsWeb){
      final ImagePicker _imagePicker= ImagePicker();
      XFile? image= await _imagePicker.pickImage(source: ImageSource.gallery);

      if(image!=null){
        var f = await image.readAsBytes();
        Uint8List webImage= f;
        String base64String = base64Encode(webImage);
        _galleryImages.add(base64String);
      }else{
      var logger = Logger();
      logger.i("Doesn't picked anything");
    }

    }else{
      var logger = Logger();
      logger.e("Something went wrong");
    }
    notifyListeners();

  }
}