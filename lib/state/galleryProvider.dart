import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

//This provider is for the gallery section.
class GalleryProvider with ChangeNotifier {
  late Uint8List selectedImageInBytes;

  final List<String> _galleryImages = [];
  final List<XFile> _galleryImagesFile = [];
  String _logo = '';
  List<XFile> _logoFile= [];
  bool _logoError= false;

  List<String> get galleryImages => _galleryImages;
  List<XFile> get galleryImagesFile => _galleryImagesFile;
  String get logo => _logo;
  List<XFile> get logoFile=>_logoFile;
  bool get logoError=>_logoError;

  set logoError(bool value){
    _logoError=value;

    notifyListeners();
  }

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

        // File imageFile = File(image.path);
        _galleryImagesFile.add(image);
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
    _galleryImagesFile.removeAt(index);
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
        _galleryImages[index] = base64String;

        // File imageFile = File(image.path);
        _galleryImagesFile[index] = image;
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
        logo = base64String;

        if(_logoFile.isEmpty){
          _logoFile.add(image);
          print(_logoFile);
        }else{
          _logoFile[0]=image;
          
        }

        // File imageFile = File(image.path);
        // _galleryImagesFile.add(image);
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

  







// Future<void> createCloudinaryPreset() async {
//   print('creating preset');
//   String cloudName = 'dhrgagb1e';
//   String apiKey = '959424356477687';
//   String apiSecret = '59aPyFw2eVjgWyUN3Hq-BH94acY';

//   // Cloudinary preset creation endpoint
//   String endpoint = 'https://api.cloudinary.com/v1_1/$cloudName/upload_presets';

//   // Define the preset parameters
//   Map<String, dynamic> presetData = {
//     'name': 'my_preset',
//     'unsigned': true,
//     'categorization': 'google_tagging,google_video_tagging',
//     'auto_tagging': 0.75,
//     'background_removal': 'none',
//     'folder': 'new-products',
//     // Add more parameters as needed
//   };

//   // Encode the data
//   String encodedData = json.encode(presetData);

//   // Create the HTTP request
//   http.Response response = await http.post(
//     Uri.parse(endpoint),
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Basic ${base64Encode(utf8.encode('$apiKey:$apiSecret'))}',
//     },
//     body: encodedData,
//   );
//   print(response.statusCode);

//   // Check the response
//   if (response.statusCode == 200) {
//     print('Cloudinary preset created successfully.');
//   } else {
//     print('Failed to create Cloudinary preset. Status code: ${response.statusCode}');
//     print('Response body: ${response.body}');
//   }
// }






}
