import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';

class HackathonTextPropertiesProvider with ChangeNotifier {
  // textFieldPropertiesMap temporary saves all the text properties of every text form field
  Map<GlobalKey, TextFieldProperties> textFieldPropertiesMap = {};
  String _selectedFont = 'Roboto';
  bool _isBoldSelected = false;
  final List<String> myGoogleFonts = [
    "Abril Fatface",
    "Aclonica",
    "Alegreya Sans",
    "Architects Daughter",
    "Archivo",
    "Archivo Narrow",
    "Bebas Neue",
    "Bitter",
    "Bree Serif",
    "Bungee",
    "Cabin",
    "Cairo",
    "Coda",
    "Comfortaa",
    "Comic Neue",
    "Cousine",
    "Croissant One",
    "Faster One",
    "Fira Sans",
    "Forum",
    "Great Vibes",
    "Heebo",
    "Inconsolata",
    "Josefin Slab",
    "Lato",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mukta",
    "Nunito",
    "Offside",
    "Open Sans",
    "Oswald",
    "Overlock",
    "Pacifico",
    "Playfair Display",
    "Poppins",
    "Raleway",
    "Roboto",
    "Roboto Mono",
    "Source Sans Pro",
    "Space Mono",
    "Spicy Rice",
    "Squada One",
    "Sue Ellen Francisco",
    "Trade Winds",
    "Ubuntu",
    "Varela",
    "Vollkorn",
    "Work Sans",
    "Zilla Slab",
  ];

   Map<String, FontWeight> fontWeightMapping = {
    'Thin': FontWeight.w100,
    'Extra Light': FontWeight.w200,
    'Light': FontWeight.w300,
    'Regular': FontWeight.w400,
    'Medium': FontWeight.w500,
    'Semi Bold': FontWeight.w600,
    'Bold': FontWeight.w700,
    'Extra Bold': FontWeight.w800,
    'Black': FontWeight.w900,
  };


/*Updating the fontweight by taking the fontweight for the respective font like 
value for thin is 100; so taking the value 100 , if thin is selected */
void updateFontWeight(String fontWeightName){
  final fontWeight = fontWeightMapping[fontWeightName];
  if(fontWeight != null && _selectedTextFieldKey != null){
    textFieldPropertiesMap[_selectedTextFieldKey]!.fontWeight = fontWeight.index*100 + 100 ;
    notifyListeners();
  }
}

// void setSelectedTextFieldKey(GlobalKey? value) {
//   _selectedTextFieldKey = value;
//   notifyListeners();
// }

//Setting the fontWeight for the selected Text field
// void setFontWeightForSelectedTextField(FontWeight fontWeight){
//   if(_selectedTextFieldKey != null && textFieldPropertiesMap.containsKey(_selectedTextFieldKey)){
//     textFieldPropertiesMap[_selectedTextFieldKey]!.fontWeight = fontWeight.index;
//     notifyListeners();
//   }
// }

FontWeight getSelectedTextFieldFontWeight(GlobalKey key) {
      if (textFieldPropertiesMap.containsKey(key)) {
      int weightIndex = textFieldPropertiesMap[key]!.fontWeight;
      return _fontWeightFromInt(weightIndex);
    }
    return FontWeight.normal;
}

FontWeight _fontWeightFromInt(int weight) {
  switch (weight) {
    case 100:
      return FontWeight.w100;
    case 200:
      return FontWeight.w200;
    case 300:
      return FontWeight.w300;
    case 400:
      return FontWeight.w400;
    case 500:
      return FontWeight.w500;
    case 600:
      return FontWeight.w600;
    case 700:
      return FontWeight.w700;
    case 800:
      return FontWeight.w800;
    case 900:
      return FontWeight.w900;
    default:
      return FontWeight.normal;
  }
}

 bool isFontWeightSelected(String fontWeightName) {
   if (_selectedTextFieldKey != null) {
    final currentWeight = getSelectedTextFieldFontWeight(_selectedTextFieldKey!);
    return currentWeight == fontWeightMapping[fontWeightName];
    }
    return false;
  }



  // _selectedTextFieldKey helps determining which text form field is getting onTapped
  GlobalKey? _selectedTextFieldKey;

  GlobalKey? get selectedTextFieldKey => _selectedTextFieldKey;

  set selectedTextFieldKey(GlobalKey? value) {
    _selectedTextFieldKey = value;
    notifyListeners();
  }

//Here we are updating the font of the textfield after changing it from the dropdown
  void updateFontForSelectedTextField(){
    if(_selectedTextFieldKey != null && textFieldPropertiesMap.containsKey(selectedTextFieldKey)){
      textFieldPropertiesMap[_selectedTextFieldKey]!.font = _selectedFont;
      notifyListeners();
    }
  }

// When a text field is selected, update the selected font to reflect its font
void updateSelectedFontFromTextField(){
  if(_selectedTextFieldKey != null && textFieldPropertiesMap.containsKey(selectedTextFieldKey)){
    _selectedFont = textFieldPropertiesMap[_selectedTextFieldKey]!.font;
    notifyListeners();
  }
}


//Get the selected font
  String get selectedFont => _selectedFont;

  void setSelectedFont(String value){
    _selectedFont = value;
    notifyListeners();
  }

  //Get whether the bold is clicked or not
  bool get isBoldSelected => _isBoldSelected;
  void setBoldSelection(){
    _isBoldSelected = !_isBoldSelected;
    notifyListeners();
  }

//Set the italics value for the respective textField
  void toggleItalicsForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.italics = 
        !textFieldPropertiesMap[_selectedTextFieldKey!]!.italics;
      notifyListeners();
    }
  }

//Fetch whether the italics is enabled for the respective textField
  bool isItalicsEnabledForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      return textFieldPropertiesMap[_selectedTextFieldKey!]!.italics;
    }
    return false;
  }


  //Set the underline value for the respective textField
  void toggleUnderlineForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.underline = 
        !textFieldPropertiesMap[_selectedTextFieldKey!]!.underline;
      notifyListeners();
    }
  }

//Fetch whether the underline is enabled for the respective textField
  bool isUnderlineEnabledForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      return textFieldPropertiesMap[_selectedTextFieldKey!]!.underline;
    }
    return false;
  }

  void increaseFontSize() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.size += 1;
      print(textFieldPropertiesMap[_selectedTextFieldKey!]!.size);
      notifyListeners();
    }
  }

   void decreaseFontSize() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey) && textFieldPropertiesMap[_selectedTextFieldKey!]!.size >= 2) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.size -= 1;
      print(textFieldPropertiesMap[_selectedTextFieldKey!]!.size);
      notifyListeners();
    }
  }


}
