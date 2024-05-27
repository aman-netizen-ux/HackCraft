import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/all_hackathons.dart';
import 'package:major_project__widget_testing/api/get_single_hackathon.dart';
import 'package:major_project__widget_testing/api/get_userType.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';

//This provider is for the gallery section.
class SingleHackathonProvider with ChangeNotifier {
  DefaultTemplateApiResponse _singleHackathon = DefaultTemplateApiResponse(
    hackathons: Hackathon(
        // Provide default or initial values here
        id: '',
        name: '',
        logo: "",
        organisationName: '',
        modeOfConduct: '',
        deadline: '',
        teamSize: [],
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
        totalRounds: '',
        images: []),
    rounds: [],
    fields: [],
    containers: [],
  );
  bool _isLoading = false;
  String _userType = "";
  String _teamId = "";

  DefaultTemplateApiResponse get singleHackathon => _singleHackathon;
  bool get isLoading => _isLoading;
  String get userType => _userType;
 String get teamId => _teamId;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getUserType(String hackathonId, String email)async {
    final response= await GetUserType().getuserType(hackathonId, email);
    print("Im in usertype fun");

    if(response!=null){
       print("Im in usertype fun response not null ${response.role}");
      _userType= response.role;
      _teamId=response.teamId;
    }else{
      _userType="notdefined";
    }
    notifyListeners();
  }

  Future<void> getSingleHackathonsList(String id) async {
    final response = await GetSingleHackathon().getSingleHackathon(id);
    debugPrint('response : $response');
    if (response != null && response is DefaultTemplateApiResponse) {
      _singleHackathon = response; // Directly assign the response
    } else {
      _singleHackathon = DefaultTemplateApiResponse(
        hackathons: Hackathon(
            // Provide default or initial values here
            id: '',
            name: '',
            logo: "",
            organisationName: '',
            modeOfConduct: '',
            deadline: '',
            teamSize: [],
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
            totalRounds: '',
            images: []),
        rounds: [],
        fields: [],
        containers: [],
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
