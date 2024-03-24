import 'package:flutter/material.dart';

class CustomEditPortal extends ChangeNotifier{
  List<Widget> _customWidgetList = [];
  GlobalKey? _selectedWidgetKey;

  List<Widget> get customWidgetList => _customWidgetList;

  void updateWidgetList(Widget widget){
    _customWidgetList.add(widget);
    notifyListeners();
  }
}