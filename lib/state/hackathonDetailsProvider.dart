import 'package:flutter/material.dart';


class HackathonDetailsProvider with ChangeNotifier {
  String  _hackathonName= "";
  String _hackathonDescription = "";
  String _hackathonDate = ""; //TODO: Need to be discussed the type of date
  String _hackathonModeOfConduct = "";
  String _hackathonFee = "";
  int _hackathonTeamSize = 0;
  String _hackathonVenue = "";
  String _hackathonAbout="";
  String _contactMemberName1="";
  String _contactMemberName2="";
  String _contactMeberNumber1="";
  String _contactMeberNumber2="";

//Hackathon Name
  String get hackathonName => _hackathonName;

  set hackathonName(String name) {
    _hackathonName = name;
    notifyListeners();
  }

  //Hackathon Description
  String get hackathonDescription => _hackathonDescription;

  set hackathonDescription(String desc) {
    _hackathonDescription = desc;
    notifyListeners();
  }

  //Hackathon Date
  String get hackathonDate => _hackathonDate;

  set hackathonDate(String date) {
    _hackathonDate = date;
    notifyListeners();
  }

  //Hackathon Mode of Conduct
  String get hackathonMode => _hackathonModeOfConduct;

  set hackathonMode(String mode) {
    _hackathonModeOfConduct = mode;
    notifyListeners();
  }

  //Hackathon Fee
  String get hackathonfee => _hackathonFee;

  set hackathonfee(String fee) {
    _hackathonFee = fee;
    notifyListeners();
  }

  //Hackathon Team Size
  int get hackathonTeamSize => _hackathonTeamSize;

  set hackathonTeamSize(int size) {
    _hackathonTeamSize = size;
    notifyListeners();
  }

  //Hackathon Venue
  String get hackathonVenue => _hackathonVenue;

  set hackathonVenue(String venue) {
    _hackathonVenue = venue;
    notifyListeners();
  }

  //Hackathon About
  String get hackathonAbout => _hackathonAbout;

  set hackathonAbout(String about) {
    _hackathonAbout = about;
    notifyListeners();
  }


  //Hackathon ContactName 1
  String get hackathonContactName1 => _contactMemberName1;

  set hackathonContactName1(String value) {
    _contactMemberName1 = value;
    notifyListeners();
  }

    //Hackathon ContactName 1
  String get hackathonContactName2 => _contactMemberName2;

  set hackathonContactName2(String value) {
    _contactMemberName2 = value;
    notifyListeners();
  }

    //Hackathon ContactName 1
  String get hackathonContactNumber1 => _contactMeberNumber1;

  set hackathonContactNumber1(String value) {
    _contactMeberNumber1 = value;
    notifyListeners();
  }

    //Hackathon ContactName 1
  String get hackathonContactNumber2 => _contactMeberNumber2;

  set hackathonContactNumber2(String value) {
    _contactMeberNumber2 = value;
    notifyListeners();
  }
}
