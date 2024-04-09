import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/referral.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/registration.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/settings.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/user_profile.dart';

class ProfileProvider extends ChangeNotifier{

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void  setSelectedIndex(int index){
    _selectedIndex= index;
    notifyListeners();
  }

  List<Widget> pages = [
    const UserProfile(),
    const Registrations(),
    const Referral(),
    const Settings()
  ];


}