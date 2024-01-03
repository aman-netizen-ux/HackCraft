import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:provider/provider.dart';

class HackathonDetailsProvider with ChangeNotifier {
//   String  _hackathonName= "";
//   String _hackathonDescription = "";
//   String _hackathonDate = ""; //TODO: Need to be discussed the type of date
//   String _hackathonModeOfConduct = "";
//   String _hackathonFee = "";
//   int _hackathonTeamSize = 0;
//   String _hackathonVenue = "";
//   String _hackathonAbout="";
//   String _contactMemberName1="";
//   String _contactMemberName2="";
//   String _contactMeberNumber1="";
//   String _contactMeberNumber2="";

// //Hackathon Name
//   String get hackathonName => _hackathonName;

//   set hackathonName(String name) {
//     _hackathonName = name;
//     notifyListeners();
//   }

//   //Hackathon Description
//   String get hackathonDescription => _hackathonDescription;

//   set hackathonDescription(String desc) {
//     _hackathonDescription = desc;
//     notifyListeners();
//   }

//   //Hackathon Date
//   String get hackathonDate => _hackathonDate;

//   set hackathonDate(String date) {
//     _hackathonDate = date;
//     notifyListeners();
//   }

//   //Hackathon Mode of Conduct
//   String get hackathonMode => _hackathonModeOfConduct;

//   set hackathonMode(String mode) {
//     _hackathonModeOfConduct = mode;
//     notifyListeners();
//   }

//   //Hackathon Fee
//   String get hackathonfee => _hackathonFee;

//   set hackathonfee(String fee) {
//     _hackathonFee = fee;
//     notifyListeners();
//   }

//   //Hackathon Team Size
//   int get hackathonTeamSize => _hackathonTeamSize;

//   set hackathonTeamSize(int size) {
//     _hackathonTeamSize = size;
//     notifyListeners();
//   }

//   //Hackathon Venue
//   String get hackathonVenue => _hackathonVenue;

//   set hackathonVenue(String venue) {
//     _hackathonVenue = venue;
//     notifyListeners();
//   }

//   //Hackathon About
//   String get hackathonAbout => _hackathonAbout;

//   set hackathonAbout(String about) {
//     _hackathonAbout = about;
//     notifyListeners();
//   }

//   //Hackathon ContactName 1
//   String get hackathonContactName1 => _contactMemberName1;

//   set hackathonContactName1(String value) {
//     _contactMemberName1 = value;
//     notifyListeners();
//   }

//     //Hackathon ContactName 1
//   String get hackathonContactName2 => _contactMemberName2;

//   set hackathonContactName2(String value) {
//     _contactMemberName2 = value;
//     notifyListeners();
//   }

//     //Hackathon ContactName 1
//   String get hackathonContactNumber1 => _contactMeberNumber1;

//   set hackathonContactNumber1(String value) {
//     _contactMeberNumber1 = value;
//     notifyListeners();
//   }

//     //Hackathon ContactName 1
//   String get hackathonContactNumber2 => _contactMeberNumber2;

//   set hackathonContactNumber2(String value) {
//     _contactMeberNumber2 = value;
//     notifyListeners();
//   }

//  final List<Round> _roundsList = [

//     Round(serialNumber: 1,
//     name: "round 1",
//     description: "Round 1 description",
//     startTimeline: "2024-12-12",
//     endTimeline: "2024-12-12")
//       ];

  List<Round> get roundsList => _hackathonDetails.rounds;

  void increaseRoundsCount() {
    _hackathonDetails.rounds.add(Round(
        serialNumber: _hackathonDetails.rounds.length + 1,
        name: "",
        description: "",
        startTimeline: "",
        endTimeline: ""));
    notifyListeners();
  }

  void deleteRound(int index, BuildContext context) {
    if (index >= 0 && index < _hackathonDetails.rounds.length) {
      final rulesProvider = Provider.of<RulesProvider>(context, listen: false);
      rulesProvider.setEditSelectedIndex(index - 1);
      _hackathonDetails.rounds.removeAt(index);
      notifyListeners();
    } else {
      debugPrint("Invalid index");
    }
  }

  // Function to update round description
  void updateRoundDescription(int index, String newDescription) {
    if (index >= 0 && index < _hackathonDetails.rounds.length) {
      _hackathonDetails.rounds[index].description = newDescription;
      notifyListeners();
    } else {
      debugPrint("Invalid index");
    }
  }

  // Function to update round description
  void updateRoundTitle(int index, String newTitle) {
    if (index >= 0 && index < _hackathonDetails.rounds.length) {
      _hackathonDetails.rounds[index].name = newTitle;
      notifyListeners();
    } else {
      debugPrint("Invalid index");
    }
  }

  void updateRoundStartDate(int index, String startDate) {
    if (index >= 0 && index < _hackathonDetails.rounds.length) {
      _hackathonDetails.rounds[index].startTimeline = startDate;
      notifyListeners();
    } else {
      debugPrint("Invalid index");
    }
  }

  void updateRoundEndDate(int index, String endDate) {
    if (index >= 0 && index < _hackathonDetails.rounds.length) {
      _hackathonDetails.rounds[index].endTimeline = endDate;
      notifyListeners();
    } else {
      debugPrint("Invalid index");
    }
  }

  DefaultTemplateApiResponse _hackathonDetails = DefaultTemplateApiResponse(
    hackathons: Hackathon(
      // Provide default or initial values here
      id: "",
      name: '',
      organisationName: '',
      modeOfConduct: '',
      deadline: '',
      teamSize: -1,
      visible: '',
      startDateTime: '',
      about: '',
      brief: '',
      website: '',
      fee: '',
      venue: '',
      contact1Name: '',
      contact1Number: '',
      contact2Name: '',
      contact2Number: '',
    ),
    rounds: [
      Round(
          serialNumber: 1,
          name: "",
          description: "",
          startTimeline: "",
          endTimeline: "")
    ],
    fields: [],
    containers: [],
  );

  // Getter
  DefaultTemplateApiResponse get hackathonDetails => _hackathonDetails;

  // Setter
  set hackathonDetails(DefaultTemplateApiResponse response) {
    _hackathonDetails = response;
    notifyListeners();
  }

  String get hackathonName => _hackathonDetails.hackathons.name;

  set hackathonName(String value) {
    _hackathonDetails.hackathons.name = value;
    notifyListeners();
  }

  String get organisationName => _hackathonDetails.hackathons.organisationName;

  set organisationName(String value) {
    _hackathonDetails.hackathons.organisationName = value;
    notifyListeners();
  }

  String get modeOfConduct => _hackathonDetails.hackathons.modeOfConduct;

  set modeOfConduct(String value) {
    _hackathonDetails.hackathons.modeOfConduct = value;
    notifyListeners();
  }

  String get deadline => _hackathonDetails.hackathons.deadline;

  set deadline(String value) {
    _hackathonDetails.hackathons.deadline = value;
    notifyListeners();
  }

  int get teamSize => _hackathonDetails.hackathons.teamSize;

  set teamSize(int value) {
    _hackathonDetails.hackathons.teamSize = value;
    notifyListeners();
  }

  String get venue => _hackathonDetails.hackathons.venue;

  set venue(String value) {
    _hackathonDetails.hackathons.venue = value;
    notifyListeners();
  }

  String get startDateTime => _hackathonDetails.hackathons.startDateTime;

  set startDateTime(String value) {
    _hackathonDetails.hackathons.startDateTime = value;
    notifyListeners();
  }

  String get about => _hackathonDetails.hackathons.about;

  set about(String value) {
    _hackathonDetails.hackathons.about = value;
    notifyListeners();
  }

  String get brief => _hackathonDetails.hackathons.brief;

  set brief(String value) {
    _hackathonDetails.hackathons.brief = value;
    notifyListeners();
  }

  String get fee => _hackathonDetails.hackathons.fee;

  set fee(String value) {
    _hackathonDetails.hackathons.fee = value;
    notifyListeners();
  }

  String get contact1Name => _hackathonDetails.hackathons.contact1Name;

  set contact1Name(String value) {
    _hackathonDetails.hackathons.contact1Name = value;
    notifyListeners();
  }

  String get contact1Number => _hackathonDetails.hackathons.contact1Number;

  set contact1Number(String value) {
    _hackathonDetails.hackathons.contact1Number = value;
    notifyListeners();
  }

  String get contact2Name => _hackathonDetails.hackathons.contact2Name;

  set contact2Name(String value) {
    _hackathonDetails.hackathons.contact2Name = value;
    notifyListeners();
  }

  String get contact2Number => _hackathonDetails.hackathons.contact2Number;

  set contact2Number(String value) {
    _hackathonDetails.hackathons.contact2Number = value;
    notifyListeners();
  }

  // String get organisationName => _defaultTemplateApiResponse.hackathons.organisationName;

  // set organisationName(String name) {
  //   _defaultTemplateApiResponse.hackathons = _defaultTemplateApiResponse.hackathons.copyWith(organisationName: name);
  //   notifyListeners();
  // }
}
