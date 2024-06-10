import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/Desktop/dashboard_screen.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/PerfomanceMatrix/performance_matrix.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/RegistrationDetail/registration_detail.dart';

class DashboardProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  String _hackathonId = "";
  String get hackathonId => _hackathonId;
  void setSelectedHackathonId(String id) {
    _hackathonId = id;
  }

  String _name = "";
  String get name => _name;
  void setName(String nam) {
    _name = nam;
  }

  bool _isLoading = false;
  bool get isLoadin => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
  }

  List<Widget> pages = const [
    DashboardScreen(),
   // PerformanceMatrix(),
    RegistrationDetails(),
    Text("data"),
  ];
}
