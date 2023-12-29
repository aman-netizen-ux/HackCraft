// import 'package:flutter/material.dart';
// import 'package:major_project__widget_testing/api/all_hackathons.dart';
// import 'package:major_project__widget_testing/models/allHackathonsModel.dart';
// import 'dart:math';


// //This provider is for the gallery section.
// class AllHackathonProvider with ChangeNotifier{

//   List<HackathonModel> _allHackathons = [];
//   List<HackathonModel> _currentPageHackathons = [];
//   final int _itemsPerPage = 4;
//   int _currentPage = 1;
//   bool _hasNextPage = true;

//   List<HackathonModel> get allHackathons => _allHackathons;
//   List<HackathonModel> get currentPageHackathons => _currentPageHackathons;
//   int get currentPage => _currentPage;
//    int get itemsPerPage => _itemsPerPage;
//   bool get hasNextPage => _hasNextPage;

//   Future<void> getAllHackathonsList() async{
//     _allHackathons = await hackathons().getAllHackathons();
//     _hasNextPage = _allHackathons.length > itemsPerPage;
//     //setPage(1);
//      notifyListeners();
//   }

//    List<HackathonModel> get paginatedHackathons {
//     int startIndex = (_currentPage - 1) * _itemsPerPage;
//     int endIndex = min(startIndex + _itemsPerPage, _allHackathons.length);
//     return _allHackathons.sublist(startIndex, endIndex);
//   }

//   // void setPage(int pageNumber){
//   //   _currentPage = pageNumber;
//   //   int startIndex = (pageNumber - 1) * itemsPerPage;
//   //   int endIndex = min(startIndex + itemsPerPage, _allHackathons.length);
//   //   _currentPageHackathons = _allHackathons.sublist(startIndex, endIndex);
//   //   _hasNextPage= endIndex < _allHackathons.length;
//   //   notifyListeners();
//   // }

//   void nextPage(){
//    if ((_currentPage * _itemsPerPage) < _allHackathons.length) {
//       _currentPage++;
//       notifyListeners();
//     }
//   }

//   void previousPage(){
//      if (_currentPage > 1) {
//       _currentPage--;
//       notifyListeners();
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/api/all_hackathons.dart';
import 'package:major_project__widget_testing/models/allHackathonsModel.dart';

//This provider is for the gallery section.
class AllHackathonProvider with ChangeNotifier{

  List<HackathonModel> _allHackathons = [];

  List<HackathonModel> get allHackathons => _allHackathons;

  Future<void> getAllHackathonsList() async{
    _allHackathons = await hackathons().getAllHackathons();
    notifyListeners();
  }
}