import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/all_hackathons.dart';

//This provider is for the gallery section.
class AllHackathonProvider with ChangeNotifier{

  List<dynamic> _allHackathons = [];

  List<dynamic> get allHackathons => _allHackathons;

  Future<void> getAllHackathonsList() async{
    _allHackathons = await hackathons().getAllHackathons();
    notifyListeners();
  }
}