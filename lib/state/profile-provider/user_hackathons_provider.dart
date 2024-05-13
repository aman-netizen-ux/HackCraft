import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/UserProfile/get_user_registered_hackathons.dart';
import 'package:major_project__widget_testing/models/ProfileModel/userRegisteredHackathons.dart';

class UserHackathons extends ChangeNotifier {
  UserRegisteredHackathons? _userHackathons;
  UserRegisteredHackathons? get userHackathons => _userHackathons;

  Future<void> fetchUserHackathons(
      String emailId, String filterType, String hackathonType) async {
    debugPrint('id: $emailId');
    try {
      _userHackathons = await fetchUserRegisteredHackathons(
          emailId, hackathonType, filterType);
      debugPrint("User hackathons retrieved 🥂😎");
      debugPrint("here it is : $_userHackathons");
    } catch (e, stackTrace) {
      debugPrint("Error fetching user hackathons: $e");
      debugPrint("Stack Trace: $stackTrace");
      _userHackathons = null;
    }
    notifyListeners();
  }
}
