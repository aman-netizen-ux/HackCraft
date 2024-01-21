import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';

class RulesProvider with ChangeNotifier {
  //Initially image will be shown to the user
  Widget _descriptionWidget =
      SvgPicture.asset('assets/images/defaultTemplate/clickme.svg');

  Widget _editDescriptionWidget =
      SvgPicture.asset('assets/images/defaultTemplate/clickme.svg');

  int _selectedIndex = -1;
  int _editSelectedIndex = -1;

  int get selectedIndex => _selectedIndex;
  int get editSelectedIndex => _editSelectedIndex;

  List<TextEditingController> descriptionControllers = [TextEditingController()];

  void addDescriptionControllers(){
    descriptionControllers.add(TextEditingController());
    notifyListeners();
  }

  void deleteDescriptionControllers(int index){
    if(index < descriptionControllers.length){
      descriptionControllers.removeRange(index, min(index, descriptionControllers.length));
    }
    notifyListeners();
  }


  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setEditSelectedIndex(int index) {
    _editSelectedIndex = index;
    notifyListeners();
  }

  Widget get descriptionWidget => _descriptionWidget;
  Widget get editDescriptionWidget => _editDescriptionWidget;

//When the user clicks on any card, the _description widget will get updated with the description of that round, and instead of an image, text will now be shown.
  void setDescriptionWidget(Widget value) {
    _descriptionWidget = value;
    notifyListeners();
  }

  void setEditDescriptionWidget(Widget value) {
    _editDescriptionWidget = value;
    notifyListeners();
  }
}
