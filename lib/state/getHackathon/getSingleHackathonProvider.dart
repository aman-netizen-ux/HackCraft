import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/all_hackathons.dart';
import 'package:major_project__widget_testing/api/get_single_hackathon.dart';

//This provider is for the gallery section.
class AllHackathonProvider with ChangeNotifier{

  Map<String, dynamic> _singleHackathon = {};

  Map<String, dynamic>  get singleHackathon => _singleHackathon;

  Future<void> getAllHackathonsList(String id) async{
    _singleHackathon = await hackathon().getSingleHackathon(id);
    notifyListeners();
  }
}