import 'package:flutter/material.dart';

//This provider is for the gallery section.
class GalleryProvider with ChangeNotifier{

  //The demo list is there to show the images in the gallery.
  final List<String> _galleryImages = [
    'assets/images/defaultTemplate/GalleryImage.png',
    'assets/images/defaultTemplate/GalleryImage.png',
    'assets/images/defaultTemplate/GalleryImage.png',
     'assets/images/defaultTemplate/GalleryImage.png',
      'assets/images/defaultTemplate/GalleryImage.png'
  ];

  List<String> get galleryImages => _galleryImages;

  // void setGalleryImages(String imagePath){
  //   _galleryImages = imagePath;
  // }
}