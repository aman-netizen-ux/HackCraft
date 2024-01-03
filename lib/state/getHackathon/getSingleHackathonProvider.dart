import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/all_hackathons.dart';
import 'package:major_project__widget_testing/api/get_single_hackathon.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';

//This provider is for the gallery section.
class SingleHackathonProvider with ChangeNotifier {
  DefaultTemplateApiResponse _singleHackathon = DefaultTemplateApiResponse(
    hackathons: Hackathon(
      // Provide default or initial values here
      id: '',
      name: '',
      organisationName: '',
      modeOfConduct: '',
      deadline: '',
      teamSize: 0,
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
    rounds: [],
    fields: [],
    containers: [],
  );
  bool _isLoading = false;

  DefaultTemplateApiResponse get singleHackathon => _singleHackathon;
  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getSingleHackathonsList(String id) async {
    final response = await GetSingleHackathon().getSingleHackathon(id);
    if (response != null && response is DefaultTemplateApiResponse) {
      _singleHackathon = response; // Directly assign the response
    } else {
      _singleHackathon = DefaultTemplateApiResponse(
        hackathons: Hackathon(
          // Provide default or initial values here
          id: '',
          name: '',
          organisationName: '',
          modeOfConduct: '',
          deadline: '',
          teamSize: 0,
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
        rounds: [],
        fields: [],
        containers: [],
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
