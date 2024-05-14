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

  List<Widget> pages = const [
    DashboardScreen(),
    PerformanceMatrix(hackathonName: "hackathonName"),
    RegistrationDetails(),
    Text("data"),
  ];
}
