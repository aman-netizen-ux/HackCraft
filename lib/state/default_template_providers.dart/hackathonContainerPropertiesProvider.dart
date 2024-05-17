import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:provider/provider.dart';

class HackathonContainerPropertiesProvider with ChangeNotifier {
  // containerPropertiesMap temporary saves all the container properties of every container
  Map<GlobalKey, ContainerProperties> containerPropertiesMap = {};

  // limitContainerHeightMap saves all the limit on height of every container
  Map<GlobalKey, LimitContainerHeight> limitContainerHeightMap = {};

  // _selectedContainerKey helps determining which text form field is getting onTapped
  GlobalKey? _selectedContainerKey;

  GlobalKey? get selectedContainerKey => _selectedContainerKey;

  // bool _isContainerColorSelected = false;
  bool _isContainerColorPickerSelected = false;
  int _selectedContainerColorTool = 2;
  // bool _isContainerBorderColorSelected = false;
  // bool _isContainerBorderColorPickerSelected = false;
  // int _selectedContainerBorderColorTool = 2;
  final List<Color> _colors = [];
  final int _maxCapacity = 16;
  int _colorIndex = -1;


  int get colorIndex => _colorIndex;

  set colorIndex(int index){
    _colorIndex = index;
    notifyListeners();
  }

  set selectedContainerKey(GlobalKey? value) {
    _selectedContainerKey = value;
    notifyListeners();
  }

  void increaseContainerHeight() {
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey) &&
        limitContainerHeightMap.containsKey(_selectedContainerKey)) {
      if (limitContainerHeightMap[_selectedContainerKey]!.maxHeight >
          containerPropertiesMap[_selectedContainerKey]!.height) {
        containerPropertiesMap[_selectedContainerKey!]!.height += 1;
      }
      notifyListeners();
    }
  }

  void setContainerHeight(String value) {
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey) &&
        limitContainerHeightMap.containsKey(_selectedContainerKey)) {
      if (int.tryParse(value) != null) {
        int height = int.tryParse(value) ??
            limitContainerHeightMap[_selectedContainerKey]!.minHeight;
        if (limitContainerHeightMap[_selectedContainerKey]!.maxHeight >=
                height &&
            limitContainerHeightMap[_selectedContainerKey]!.minHeight <=
                height) {
          containerPropertiesMap[_selectedContainerKey!]!.height =
              int.tryParse(value)!;
        }
        notifyListeners();
      }
    }
  }

  void decreaseContainerHeight() {
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey) &&
        limitContainerHeightMap.containsKey(_selectedContainerKey)) {
      if (limitContainerHeightMap[_selectedContainerKey]!.minHeight <
          containerPropertiesMap[_selectedContainerKey]!.height) {
        containerPropertiesMap[_selectedContainerKey!]!.height -= 1;
      }
      notifyListeners();
    }
  }

  //SET CONTAINER BORDER WIDTH 

  void setContainerBorderWidth(String value) {
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey)) {
      if (int.tryParse(value) != null) {
        int borderWidth = int.tryParse(value) ?? 0;      
          containerPropertiesMap[_selectedContainerKey!]!.borderWidth = borderWidth;
        notifyListeners();
      }
    }
  }

  //SET CONTAINER BORDER RADIUS

  void setContainerBorderRadius(String value) {
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey)) {
      if (int.tryParse(value) != null) {
        double borderRadius = double.tryParse(value) ?? 0;      
          containerPropertiesMap[_selectedContainerKey!]!.borderRadius = borderRadius;
        notifyListeners();
      }
    }
  }

  //SET CONTAINER BORDER RADIUS

  void setContainerBlurRadius(String value) {
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey)) {
      if (int.tryParse(value) != null) {
        double blurRadius = double.tryParse(value) ?? 0;      
          containerPropertiesMap[_selectedContainerKey!]!.blurRadius = blurRadius;
        notifyListeners();
      }
    }
  }

  // SET CONTAINER COLOR 
  void containerColorChange(String colorHex, int index, ContainerColorProperties type) {
    
    if (_selectedContainerKey != null &&
        containerPropertiesMap.containsKey(_selectedContainerKey)) {
          String res = replaceElementAtIndex(getColorBasedOnType(type, _selectedContainerKey!), index, colorHex);
      setContainerPropertyBasedOnType(res, type);
      notifyListeners();
    }
  }

  void setContainerPropertyBasedOnType(String res, ContainerColorProperties type){
    switch(type){
      case ContainerColorProperties.containerBorderColor :
        containerPropertiesMap[_selectedContainerKey!]!.borderColor = res;
      case ContainerColorProperties.containerFocusedBorderColor :
        containerPropertiesMap[_selectedContainerKey!]!.focusedBorderColor = res;
      case ContainerColorProperties.boxShadowColor :
        containerPropertiesMap[_selectedContainerKey!]!.boxShadowColor = res;
      default: 
        containerPropertiesMap[_selectedContainerKey!]!.color = res;
    }
  }


  String replaceElementAtIndex(String inputString, int index, String replacement) {

  List<String> elements = inputString.split(',');

  if (index < 0 || index >= elements.length) {
    return "Index out of range";
  }

  elements[index] = replacement;

  return elements.join(',');
}

  Color getContainerPrimaryColor(Color color) {
    if (color is MaterialColor) {
      return color[500] ??
          color; // Return the primary color if it's a MaterialColor
    } else {
      return color; // Return the color itself if it's not a MaterialColor
    }
  }


  Color stringToColor(GlobalKey key, int index, ContainerColorProperties type) {
    if (containerPropertiesMap.containsKey(key)) {
      String colorList = getColorBasedOnType(type, key);
      String colorString = returnColor(index, colorList);
      try {
        // Checking if the string contains '(' and ')'
        if (colorString.contains('(') && colorString.contains(')')) {
          // Extracting the hex color code from the string
          String hexColor = colorString.split('(')[1].split(')')[0];
          // Converting to a Color object
          return Color(int.parse(hexColor));
        } else {
          throw const FormatException("Invalid format");
        }
      } catch (e) {
        var logger = Logger();
        logger.e('Error converting string to color: $colorList , $colorString');
        // Return a default color in case of an error
        return Colors.black; // Default color
      }
    }

    return Colors.black;

    // Extracting the hex color code from the string
  }


  String getColorBasedOnType(ContainerColorProperties type, GlobalKey key){
    print('type : $type, key : $key');
    switch(type) {
      case ContainerColorProperties.containerBorderColor :
        return containerPropertiesMap[key]!.borderColor;
      case ContainerColorProperties.containerFocusedBorderColor :
        return containerPropertiesMap[key]!.focusedBorderColor;
      case ContainerColorProperties.boxShadowColor :
        return containerPropertiesMap[key]!.boxShadowColor;
      default: 
        return containerPropertiesMap[key]!.color;
    }
  }


  // bool get isContainerColorSelected => _isContainerColorSelected;
  bool get isContainerColorPickerSelected => _isContainerColorPickerSelected;
  int get selectedContainerColorTool => _selectedContainerColorTool;

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

  bool isContainersColorsInSwatchList(Color targetColor, BuildContext context) {
    final provider = Provider.of<HackathonTextPropertiesProvider>(context, listen:false);
    for (int i = 0; i < provider.swatchesList.length; i++) {
      if (provider.swatchesList[i].value == targetColor.value) {
        return true;
      }
    }
    return false;
  }

  void setSelectedContainerColorTool(int value) {
    _selectedContainerColorTool = value;
    notifyListeners();
  }

  // void setIsContainerColorSelected() {
  //   _isContainerColorSelected = !_isContainerColorSelected;
  //   notifyListeners();
  // }

  void setIsContainerColorPickerSelected() {
    _isContainerColorPickerSelected = !_isContainerColorPickerSelected;
    notifyListeners();
  }

  int countElements(String inputString) {
    List<String> elements = inputString.split(',');
    return elements.length;
  }

  String returnColor(int index, String input){
    List<String> elements = input.split(',');
    if(elements.length > index && index > -1){
      return elements[index];
    }
    return " ";
    
  }


  // // SET CONTAINER BORDERCOLOR 
  // void containerBorderColorChange(String colorHex, int index) {   
  //   if (_selectedContainerKey != null &&
  //       containerPropertiesMap.containsKey(_selectedContainerKey)) {
  //         String res = replaceElementAtIndex(containerPropertiesMap[_selectedContainerKey!]!.borderColor, index, colorHex);
  //     containerPropertiesMap[_selectedContainerKey!]!.borderColor = res;
  //     notifyListeners();
  //   }
  // }

  // Color getContainerPrimaryBorderColor(Color color) {
  //   if (color is MaterialColor) {
  //     return color[500] ??
  //         color; // Return the primary color if it's a MaterialColor
  //   } else {
  //     return color; // Return the color itself if it's not a MaterialColor
  //   }
  // }

  // bool get isContainerBorderColorSelected => _isContainerBorderColorSelected;
  // bool get isContainerBorderColorPickerSelected => _isContainerBorderColorPickerSelected;
  // int get selectedContainerBorderColorTool => _selectedContainerBorderColorTool;

  // bool isContainersBorderColorsInSwatchList(Color targetColor, BuildContext context) {
  //   final provider = Provider.of<HackathonTextPropertiesProvider>(context, listen:false);
  //   for (int i = 0; i < provider.swatchesList.length; i++) {
  //     if (provider.swatchesList[i].value == targetColor.value) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }


  int _activeIndex = -1;

  get activeIndex => _activeIndex;

  void setActiveIndex(int index){
    _activeIndex = index;
    notifyListeners();
  }

  ContainerColorProperties type = ContainerColorProperties.containerColor;

  void setType(ContainerColorProperties value){
    type = value;
    notifyListeners();
  }




  List<ContainerPropertiesArray> getContainerProperties() {
    //saving the container properties in _hackathonDetails -> container in provider
//or to pass in api giving the values to container
    return [
      // ContainerPropertiesArray is the representation of every objects in the containers in api
      ContainerPropertiesArray(
          name: 'Landing Container',
          type: 'container',
          /* containerProperties contains all the properties of the single container       
         hackathonContainerPropertiesProvider.containerPropertiesMap[landingContainerKey]! gives 
         all the container properties of ContainerProperties type  in {} format 
        and putting these values in containerProperties  */
          containerProperties: containerPropertiesMap[landingContainerKey]!), //0
      ContainerPropertiesArray(
          name: 'Date Container',
          type: 'container',
          containerProperties: containerPropertiesMap[dateContainerKey]!), //1
      ContainerPropertiesArray(
          name: 'ModeofConduct Container',
          type: 'container',
          containerProperties: containerPropertiesMap[modeOfConductContainerKey]!), //2
      ContainerPropertiesArray(
          name: 'ParticipationFee Container',
          type: 'container',
          containerProperties: containerPropertiesMap[participationFeeContainerKey]!), //3
      ContainerPropertiesArray(
          name: 'Team Size Container',
          type: 'container',
          containerProperties: containerPropertiesMap[teamSizeContainerKey]!), //4
      ContainerPropertiesArray(
          name: 'Registration Count Container',
          type: 'container',
          containerProperties: containerPropertiesMap[registrationCountContainerKey]!), //5
      ContainerPropertiesArray(
          name: 'About Container',
          type: 'container',
          containerProperties: containerPropertiesMap[aboutContainerKey]!), //6  
      ContainerPropertiesArray(
          name: 'Registration Container',
          type: 'container',
          containerProperties: containerPropertiesMap[getRegisteredContainerKey]!), //7  
    ];
  }


  List<ContainerPropertiesArray> addRoundsContainerProperties(
      List<ContainerPropertiesArray> fields) {
    roundContainerGlobalKeysMap.forEach((key, value) {
      fields.addAll([
        ContainerPropertiesArray(
          name: 'round${key + 1}NameContainer',
          type: 'container',
          containerProperties: containerPropertiesMap[value['roundNameContainer']!]!,
        ),
        ContainerPropertiesArray(
          name: 'round${key + 1}DescriptionContainer',
          type: 'container',
          containerProperties: containerPropertiesMap[value['roundDescriptionContainer']!]!,
        )
      ]);
    });

    return fields;
  }

}
