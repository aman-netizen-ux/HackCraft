import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadImageToCloudinary  {
  Future<List<String>> uploadImage(List<XFile> galleryImagesFile) async {
    final cloudinaryUrl =
        Uri.parse("https://api.cloudinary.com/v1_1/dhrgagb1e/upload");

        final List<String>galleryImagesURL =[];

    for (int i = 0; i < galleryImagesFile.length; i++) {
    final request = http.MultipartRequest('POST', cloudinaryUrl);
    request.fields['upload_preset'] = 'hackathon_image';

// Check if running in web or mobile
    if (kIsWeb) {
      // Convert file to bytes and create MultipartFile
      List<int> imageBytes = await galleryImagesFile[i].readAsBytes();
      request.files.add(http.MultipartFile.fromBytes('file', imageBytes, filename: 'image_$i'));
    } else {
      // Use the method you were using before for mobile (http.MultipartFile.fromPath)
      request.files.add(await http.MultipartFile.fromPath('file', galleryImagesFile[i].path));
    }




    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap=jsonDecode(responseString);
      final url =jsonMap['url'];
      print(url);
      galleryImagesURL.add(url);//TODO: have to recheck later


    } else {
      print('Failed to upload image $i. Status code: ${response.statusCode}');
    }
    }

    return galleryImagesURL;
  }



  Future<String> uploadLogo(XFile logoFile) async {
    final cloudinaryUrl =
        Uri.parse("https://api.cloudinary.com/v1_1/dhrgagb1e/upload");

         String logoURL ='';

    final request = http.MultipartRequest('POST', cloudinaryUrl);
    request.fields['upload_preset'] = 'hackathon_logo';

// Check if running in web or mobile
    if (kIsWeb) {
      // Convert file to bytes and create MultipartFile
      List<int> imageBytes = await logoFile.readAsBytes();
      request.files.add(http.MultipartFile.fromBytes('file', imageBytes, filename: 'logo'));
    } else {
      // Use the method you were using before for mobile (http.MultipartFile.fromPath)
      request.files.add(await http.MultipartFile.fromPath('file', logoFile.path));
    }




    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap=jsonDecode(responseString);
      final url =jsonMap['url'];
      print(url);
      logoURL =url;//TODO: have to recheck later


    } else {
      print('Failed to upload logo . Status code: ${response.statusCode}');
    }
    

    return logoURL;
  }

}

