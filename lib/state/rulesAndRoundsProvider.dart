import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RulesProvider with ChangeNotifier {
  //Initially image will be shown to the user
  Widget _descriptionWidget =
      SvgPicture.asset('assets/images/defaultTemplate/clickme.svg');

      int _selectedIndex = -1;

   int get selectedIndex => _selectedIndex;

   void setSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
   }

//Demo list to show the rounds and their description
  final List<Map<String, String>> _roundsList = [
    {
      'roundTitle': 'Round 1',
      'startDate': '4 oct 2023',
      'endDate': '10 oct 2023',
      'roundDescription':
          '45, North Avenue,Northside, Townsville,State, India, Pin - 789012'
    },
    {
      'roundTitle': 'Round 2',
      'startDate': '11 oct 2023',
      'endDate': '17 oct 2023',
      'roundDescription':
          '8, East Lane, Eastville, Riverside, State, India, Pin - 234567'
    },
    {
      'roundTitle': 'Round 3',
      'startDate': '18 oct 2023',
      'endDate': '25 oct 2023',
      'roundDescription':
          '33, South Road, Southborough, Hilltop, State, India , Pin - 456789'
    },
    {
      'roundTitle': 'Round 4',
      'startDate': '26 oct 2023',
      'endDate': '2 nov 2023',
      'roundDescription':
          '21, Central Street, Centralia, Midtown, State, India Pin - 345678'
    },
    {
      'roundTitle': 'Round 5',
      'startDate': '3 nov 2023',
      'endDate': '10 nov 2023',
      'roundDescription':
          '67, West Avenue, Westville, Sunset, State, India Pin - 567890'
    },
    {
      'roundTitle': 'Round 5',
      'startDate': '3 nov 2023',
      'endDate': '10 nov 2023',
      'roundDescription':
          '67, West Avenue, Westville, Sunset, State, India Pin - 567890'
    },
  ];

  List<Map<String, String>> get roundsList => _roundsList;

  Widget get descriptionWidget => _descriptionWidget;

//When the user clicks on any card, the _description widget will get updated with the description of that round, and instead of an image, text will now be shown.
  void setDescriptionWidget(Widget value) {
    _descriptionWidget = value;
    notifyListeners();
  }
}
