import 'dart:math';

import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:provider/provider.dart';

class HackathonDetailsProvider with ChangeNotifier {
//not being used currently
  List<Round> _temporaryRoundList = [
    Round(
        serialNumber: 1,
        name: "",
        description: "",
        startTimeline: "",
        endTimeline: "")
  ];

//not being used currently
  List<Round> get temporaryRoundList => _temporaryRoundList;
  set temporaryRoundList(List<Round> value) {
    _temporaryRoundList = value;
    notifyListeners();
  }

//not being used currently
  void updateTemporaryRoundDescription(int index, String newDescription) {
    if (index >= 0 && index < _temporaryRoundList.length) {
      _temporaryRoundList[index].description = newDescription;
      notifyListeners();
    } else {
      print("Invalid index");
    }
  }

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

//not being used currently
  void increaseTemproraryRoundsCount() {
    _temporaryRoundList.add(Round(
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
      rulesProvider.editSelectedIndex == -1
          ? rulesProvider.setEditSelectedIndex(-1)
          : rulesProvider.editSelectedIndex == 0
              ? rulesProvider.setEditSelectedIndex(0)
              : rulesProvider.setEditSelectedIndex(index - 1);
      _hackathonDetails.rounds.removeAt(index);
      notifyListeners();
    } else {
      debugPrint("Invalid index");
    }
  }

//not being used currently
  void deleteTemproraryRound(int index, BuildContext context) {
    if (index >= 0 && index < _temporaryRoundList.length) {
      _temporaryRoundList.removeAt(index);
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

  void updateRoundTitle(int index, String newTitle) {
    if (index >= 0 && index < _hackathonDetails.rounds.length) {
      _hackathonDetails.rounds[index].name = newTitle;
      notifyListeners();
    } else {
      print("Invalid index");
    }
  }

//not being used currently
  void updateTemporaryRoundTile(int index, String newTile) {
    if (index >= 0 && index < _temporaryRoundList.length) {
      _temporaryRoundList[index].name = newTile;
      notifyListeners();
    } else {
      print("Invalid index");
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
      teamSize: '',
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
    fields: List.generate(
      17,
      (index) => TextFieldPropertiesArray(
          name: '',
          type: '',
          textProperties: TextFieldProperties(
            size: 0,
            align: '',
            font: '',
            fontWeight: 0,
            italics: false,
            letterSpacing: -1,
            strikethrogh: false,
            textColor: '',
            underline: false,
            upperCase: false,
          )),
    ),
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

  String get teamSize => _hackathonDetails.hackathons.teamSize;

  set teamSize(String value) {
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

  List<TextFieldPropertiesArray> get textFields => _hackathonDetails.fields;

  set textFields(List<TextFieldPropertiesArray> value) {
    _hackathonDetails.fields = value;
    notifyListeners();
  }

  void addTextPropertiesInFields() {
    _hackathonDetails.fields.addAll(List.generate(
      4,
      (index) => TextFieldPropertiesArray(
          name: '',
          type: '',
          textProperties: TextFieldProperties(
            size: 0,
            align: '',
            font: '',
            fontWeight: 0,
            italics: false,
            letterSpacing: -1,
            strikethrogh: false,
            textColor: '',
            underline: false,
            upperCase: false,
          )),
    ));
  }


  void deleteTextPropertiesOfRoundsFromFields(int n) {
  // Calculate the starting index for deletion
  int startIndex = 13 + 4 * n;

  // Perform deletion if the starting index is within the list bounds
  if (startIndex < _hackathonDetails.fields.length) {
    _hackathonDetails.fields.removeRange(startIndex, min(startIndex + 4, _hackathonDetails.fields.length));
  }
}


//not being used currently
  void synchronizeTemporaryRoundListWithRoundsList() {
    _temporaryRoundList = List.from(_hackathonDetails.rounds);
    notifyListeners();
  }

  // String get organisationName => _defaultTemplateApiResponse.hackathons.organisationName;

  // set organisationName(String name) {
  //   _defaultTemplateApiResponse.hackathons = _defaultTemplateApiResponse.hackathons.copyWith(organisationName: name);
  //   notifyListeners();
  // }
}
