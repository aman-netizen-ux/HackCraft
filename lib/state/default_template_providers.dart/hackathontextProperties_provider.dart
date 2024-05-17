import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';

class HackathonTextPropertiesProvider with ChangeNotifier {
  // textFieldPropertiesMap temporary saves all the text properties of every text form field
  Map<GlobalKey, TextFieldProperties> textFieldPropertiesMap = {};
  String _selectedFont = 'Roboto';
  bool _isBoldSelected = false;
  bool _isTextColorSelected = false;
  bool _isColorPickerSelected = false;
  int _selectedColorTool = 2;
  final List<Color> _colors = [];
  final int _maxCapacity = 16;

  List<Color> swatchesList = <Color>[
    Colors.black,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.white,
  ];

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
  void updateFontWeight(String fontWeightName) {
    final fontWeight = fontWeightMapping[fontWeightName];
    if (fontWeight != null && _selectedTextFieldKey != null) {
      textFieldPropertiesMap[_selectedTextFieldKey]!.fontWeight =
          fontWeight.index * 100 + 100;
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

  Color getPrimaryColor(Color color) {
    if (color is MaterialColor) {
      return color[500] ??
          color; // Return the primary color if it's a MaterialColor
    } else {
      return color; // Return the color itself if it's not a MaterialColor
    }
  }

  Color stringToColor(GlobalKey key) {
    if (textFieldPropertiesMap.containsKey(key)) {
      String colorString = textFieldPropertiesMap[key]!.textColor;
      try {
        // Checking if the string contains '(' and ')'
        if (colorString.contains('(') && colorString.contains(')')) {
          // Extracting the hex color code from the string
          String hexColor = colorString.split('(')[1].split(')')[0];
          // Converting to a Color object
          return Color(int.parse(hexColor));
        } else {
          throw FormatException("Invalid format");
        }
      } catch (e) {
        var logger = Logger();
        logger.e('Error converting string to color: $e');
        // Return a default color in case of an error
        return Colors.black; // Default color
      }
    }

    return Colors.black;

    // Extracting the hex color code from the string
  }

  FontWeight getSelectedTextFieldFontWeight(GlobalKey key) {
    if (textFieldPropertiesMap.containsKey(key)) {
      int weightIndex = textFieldPropertiesMap[key]!.fontWeight;
      return fontWeightFromInt(weightIndex);
    }
    return FontWeight.normal;
  }

  FontWeight fontWeightFromInt(int weight) {
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
      final currentWeight =
          getSelectedTextFieldFontWeight(_selectedTextFieldKey!);
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
  void updateFontForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey]!.font = _selectedFont;
      notifyListeners();
    }
  }

// When a text field is selected, update the selected font to reflect its font
  void updateSelectedFontFromTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(selectedTextFieldKey)) {
      _selectedFont = textFieldPropertiesMap[_selectedTextFieldKey]!.font;
      notifyListeners();
    }
  }

//Get the selected font
  String get selectedFont => _selectedFont;

  void setSelectedFont(String value) {
    _selectedFont = value;
    notifyListeners();
  }

  //Get whether the bold is clicked or not
  bool get isBoldSelected => _isBoldSelected;
  bool get isTextColorSelected => _isTextColorSelected;
  bool get isColorPickerSelected => _isColorPickerSelected;
  int get selectedColorTool => _selectedColorTool;

  List<Color> get colors => _colors;

  void addColor(Color color) {
    if (_colors.length < _maxCapacity) {
      _colors.add(color);
    } else {
      // Once we reach max capacity, we start replacing from the beginning
      _colors.removeAt(0); // Remove the first element
      _colors.add(color); // Add the new color
    }
    notifyListeners(); // Notify listeners about the change
  }

  void setSelectedColorTool(int value) {
    _selectedColorTool = value;
    notifyListeners();
  }

  void setIsTextColorSelected() {
    _isTextColorSelected = !_isTextColorSelected;
    notifyListeners();
  }

  void setIsColorPickerSelected() {
    _isColorPickerSelected = !_isColorPickerSelected;
    notifyListeners();
  }

  void setBoldSelection() {
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

//Set the strikeThrough value for the respective textField
  void toggleStrikeThroughForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.strikethrogh =
          !textFieldPropertiesMap[_selectedTextFieldKey!]!.strikethrogh;
      notifyListeners();
    }
  }

  //Set the  value for the respective textField
  void toggleAllCapsForSelectedTextField() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.upperCase =
          !textFieldPropertiesMap[_selectedTextFieldKey!]!.upperCase;
      notifyListeners();
    }
  }

  //To store the initial written text in the textfield
  Map<GlobalKey, String> _originalTexts = {};

  void convertAndRevertBackFromUpperCase(
      TextEditingController controller, GlobalKey key) {
    var upperCase = textFieldPropertiesMap[key]!.upperCase;

    if (upperCase) {
      if (!_originalTexts.containsKey(key)) {
        // Store the original text before converting to uppercase
        _originalTexts[key] = controller.text;
      }
      controller.text = controller.text.toUpperCase();
    } else {
      // Transition from uppercase to non-uppercase
      if (_originalTexts.containsKey(key)) {
        String originalText = _originalTexts[key]!;
        String currentText = controller.text;

        // Reconstruct the text by applying deletions and additions to the original text
        String reconstructedText = reconstructText(originalText, currentText);

        controller.text = reconstructedText;
        _originalTexts.remove(key);
      }
    }
  }

//This function helps in keeping the modifications in the original change intact
  String reconstructText(String originalText, String currentText) {
    // Convert the original text to uppercase for comparison
    String originalTextUpper = originalText.toUpperCase();

    // Find the common prefix and suffix between the original (in uppercase) and current text
    int prefixLength = 0;
    while (prefixLength < originalTextUpper.length &&
        prefixLength < currentText.length &&
        originalTextUpper[prefixLength] == currentText[prefixLength]) {
      prefixLength++;
    }

    int suffixLength = 0;
    while (suffixLength + prefixLength < originalTextUpper.length &&
        suffixLength + prefixLength < currentText.length &&
        originalTextUpper[originalTextUpper.length - suffixLength - 1] ==
            currentText[currentText.length - suffixLength - 1]) {
      suffixLength++;
    }

    // Reconstruct the text by keeping the original (non-uppercase) prefix and suffix,
    // and using the current text for the middle part
    String prefix = originalText.substring(0, prefixLength);
    String middle =
        currentText.substring(prefixLength, currentText.length - suffixLength);
    String suffix = originalText.substring(originalText.length - suffixLength);

    return prefix + middle + suffix;
  }

  void textColorChange(String colorHex) {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.textColor = colorHex;
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
      notifyListeners();
    }
  }

  void setFontSize(String value) {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      if (int.tryParse(value) != null) {
        textFieldPropertiesMap[_selectedTextFieldKey!]!.size =
            int.tryParse(value)!;
        notifyListeners();
      }
    }
  }

  void decreaseFontSize() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey) &&
        textFieldPropertiesMap[_selectedTextFieldKey!]!.size >= 2) {
      textFieldPropertiesMap[_selectedTextFieldKey!]!.size -= 1;
      notifyListeners();
    }
  }

  //Set the alignment of the text alongwith their respective icon

  //Alignment icon for the respective alignment
  IconData getAlignmentIcon() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      var currentAlignment =
          textFieldPropertiesMap[_selectedTextFieldKey]!.align;

      switch (currentAlignment) {
        case 'left':
          return Icons.format_align_left_rounded;
        case 'right':
          return Icons.format_align_right_rounded;
        case 'center':
          return Icons.format_align_center_rounded;
        case 'justify':
          return Icons.format_align_justify_rounded;
      }
    }
    return Icons.format_align_center_rounded;
  }

  int checkSelectedFiefdKeyIsRoundDate() {
    for (int i = 0; i < roundGlobalKeysMap.length; i++) {
      if (_selectedTextFieldKey == roundGlobalKeysMap[i]!['roundEndDate']! ||
          _selectedTextFieldKey == roundGlobalKeysMap[i]!['roundStartDate']) {
        return i;
      }
    }
    return -1;
  }

  void toggleTextAlignment() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      var currentAlignment =
          textFieldPropertiesMap[_selectedTextFieldKey]!.align;

      switch (currentAlignment) {
        case 'left':
          textFieldPropertiesMap[_selectedTextFieldKey]!.align = 'center';
          break;
        case 'center':
          textFieldPropertiesMap[_selectedTextFieldKey]!.align = 'right';
          break;
        case 'right':
          textFieldPropertiesMap[_selectedTextFieldKey]!.align = 'justify';
          break;
        case 'justify':
          textFieldPropertiesMap[_selectedTextFieldKey]!.align = 'left';
          break;
        default:
          textFieldPropertiesMap[_selectedTextFieldKey]!.align = 'left';
          break;
      }
      notifyListeners();
    }
  }

  void toggleRoundTextAlignment(int index) {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      var currentAlignment =
          textFieldPropertiesMap[_selectedTextFieldKey]!.align;

      switch (currentAlignment) {
        case 'left':
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundStartDate']!]!
              .align = 'center';
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundEndDate']!]!
              .align = 'center';
          break;
        case 'center':
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundStartDate']!]!
              .align = 'right';
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundEndDate']!]!
              .align = 'right';
          break;
        case 'right':
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundStartDate']!]!
              .align = 'justify';
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundEndDate']!]!
              .align = 'justify';
          break;
        case 'justify':
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundStartDate']!]!
              .align = 'left';
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundEndDate']!]!
              .align = 'left';
          break;
        default:
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundStartDate']!]!
              .align = 'left';
          textFieldPropertiesMap[roundGlobalKeysMap[index]!['roundEndDate']!]!
              .align = 'left';
          break;
      }
      notifyListeners();
    }
  }

  //Convert the string alignment coming from the API to TextAlign
  // has shifted to defaultTemplte provider
  TextAlign getTextAlign(String align) {
    switch (align) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'justify':
        return TextAlign.justify;
      default:
        return TextAlign.center;
    }
  }

// has shifted to defaultTemplte provider
  AlignmentGeometry getTextAlignForContainer(String align) {
    switch (align) {
      case 'left':
        return Alignment.centerLeft;
      case 'right':
        return Alignment.centerRight;
      case 'center':
        return Alignment.center;
      case 'justify':
        return Alignment.centerLeft;
      default:
        return Alignment.center;
    }
  }

  Alignment getContainerAlign(String align) {
    switch (align) {
      case 'left':
        return Alignment.centerLeft;
      case 'right':
        return Alignment.centerRight;
      case 'center':
        return Alignment.center;
      default:
        return Alignment.center;
    }
  }

  MainAxisAlignment getMainAxisAlignment(String align) {
    switch (align) {
      case 'left':
        return MainAxisAlignment.start;
      case 'right':
        return MainAxisAlignment.end;
      case 'center':
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.center;
    }
  }

  // Set lineSpacing value
  void setLineSpacing(int spacing) {
    if (_selectedTextFieldKey != null && textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey]!.lineHeight = spacing;
      notifyListeners();
    }
  }

  int getLineSpacing() {
    if (_selectedTextFieldKey != null && textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      return textFieldPropertiesMap[_selectedTextFieldKey]!.lineHeight;
    }
    return 1; // Default value
  }

  //Set letterSpacing value
  void setLetterSpacing(int spacing) {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      textFieldPropertiesMap[_selectedTextFieldKey]!.letterSpacing = spacing;
      notifyListeners();
    }
  }

  int getLetterSpacing() {
    if (_selectedTextFieldKey != null &&
        textFieldPropertiesMap.containsKey(_selectedTextFieldKey)) {
      return textFieldPropertiesMap[_selectedTextFieldKey]!.letterSpacing;
    }
    return 1; // Default value
  }

  bool isColorsInSwatchList(Color targetColor) {
    for (int i = 0; i < swatchesList.length; i++) {
      if (swatchesList[i].value == targetColor.value) {
        return true;
      }
    }
    return false;
  }

  List<TextFieldPropertiesArray> getTextProperties() {
    //saving the text properties in _hackathonDetails ->field in provider
//or to pass in api giving the values to field
    return [
      // TextFieldPropertiesArray is the representation of every objects in the fields in api
      TextFieldPropertiesArray(
          name: 'Organization',
          type: 'text',
          /* textProperties contains all the properties of the single text        
         hackathonTextPropertiesProvider.textFieldPropertiesMap[organisationKey]! gives 
         all the text properties of TextFieldProperties type  in {} format 
        and putting these values in textProperties  */
          textProperties: textFieldPropertiesMap[organisationKey]!), //0
      TextFieldPropertiesArray(
          name: 'Hackathon Name',
          type: 'text',
          textProperties: textFieldPropertiesMap[hackathonNameKey]!), //1
      TextFieldPropertiesArray(
          name: 'brief',
          type: 'text',
          textProperties: textFieldPropertiesMap[briefKey]!), //2
      TextFieldPropertiesArray(
          name: 'hackathonStartDate',
          type: 'text',
          textProperties: textFieldPropertiesMap[hackathonStartDateKey]!), //3
      TextFieldPropertiesArray(
          name: 'Mode Of Conduct',
          type: 'text',
          textProperties: textFieldPropertiesMap[modeOfConductKey]!), //4
      TextFieldPropertiesArray(
          name: 'Participation Fee',
          type: 'text',
          textProperties: textFieldPropertiesMap[participationFeeKey]!), //5
      TextFieldPropertiesArray(
          name: 'teamSize',
          type: 'text',
          textProperties: textFieldPropertiesMap[teamSizeKey]!), //6
      TextFieldPropertiesArray(
          name: 'venue',
          type: 'text',
          textProperties: textFieldPropertiesMap[venueKey]!), //7
      TextFieldPropertiesArray(
          name: 'description',
          type: 'text',
          textProperties: textFieldPropertiesMap[descriptionKey]!), //8
      TextFieldPropertiesArray(
          name: 'contactName1',
          type: 'text',
          textProperties: textFieldPropertiesMap[contactName1Key]!), //9
      TextFieldPropertiesArray(
          name: 'contactNumber1',
          type: 'text',
          textProperties: textFieldPropertiesMap[contactNumber1Key]!), //10
      TextFieldPropertiesArray(
          name: 'contactName2',
          type: 'text',
          textProperties: textFieldPropertiesMap[contactName2Key]!), //11

      TextFieldPropertiesArray(
          name: 'contactNumber2',
          type: 'text',
          textProperties: textFieldPropertiesMap[contactNumber2Key]!) //12
    ];
  }

  List<TextFieldPropertiesArray> addRoundsTextProperties(
      List<TextFieldPropertiesArray> fields) {
    roundGlobalKeysMap.forEach((key, value) {
      fields.addAll([
        TextFieldPropertiesArray(
          name: 'round${key + 1}Name',
          type: 'text',
          textProperties: textFieldPropertiesMap[value['roundName']!]!,
        ),
        TextFieldPropertiesArray(
          name: 'round${key + 1}Description',
          type: 'text',
          textProperties: textFieldPropertiesMap[value['roundDescription']!]!,
        ),
        TextFieldPropertiesArray(
          name: 'round${key + 1}StartDate',
          type: 'text',
          textProperties: textFieldPropertiesMap[value['roundStartDate']!]!,
        ),
        TextFieldPropertiesArray(
          name: 'round${key + 1}EndDate',
          type: 'text',
          textProperties: textFieldPropertiesMap[value['roundEndDate']!]!,
        ),
      ]);
    });

    return fields;
  }
}
