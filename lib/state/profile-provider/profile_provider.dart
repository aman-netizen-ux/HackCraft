import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/UserProfile/get_user_profile.dart';
import 'package:major_project__widget_testing/models/ProfileModel/getUserProfileModel.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/referral.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/registration.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/settings.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/UserProfile/user_profile.dart';

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

  User? _user;
  User? get user => _user;

  Future<void> fetchUser( String id) async {
    debugPrint('id: $id');
    try {
    _user = await fetchUserData(id);
    debugPrint("User details retrieved: $_user");
  } catch (e, stackTrace) {
    debugPrint("Error fetching user data: $e");
    debugPrint("Stack Trace: $stackTrace");
    _user = null; // or provide a default object with fallback values
  }
    notifyListeners();
  }

  


}