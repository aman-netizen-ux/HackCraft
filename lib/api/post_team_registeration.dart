import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:major_project__widget_testing/models/memberCreateModel.dart';
import 'package:major_project__widget_testing/models/teamCreateModel.dart';

class CreateTeam {
  Future<TeamCreateResponseModel> postTeam(Map<String, dynamic> params, ) async {
    try {
      final String baseUrl = dotenv.get('postteam');
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );



      if (response.statusCode == 200) {
         final Map<String, dynamic> jsonResponse = json.decode(response.body);

        debugPrint('response of team create : $jsonResponse');

       
        return TeamCreateResponseModel.fromJson(jsonResponse);
      } else {
        // final errorResponse = jsonDecode(response.body);
        // String errorMessage = '';
        // errorResponse['error'].forEach((k, v) {
        //   errorMessage += '$k: ${v.join(', ')}\n';
        // });
        debugPrint(" normal body : ${response.body}");
        debugPrint('error at 39 in team create: ${jsonDecode(response.body)} ,  ');

        return TeamCreateResponseModel(leader: "");
      }
    } catch (e) {
      debugPrint('error in catch of team create : $e');
      return TeamCreateResponseModel(leader: "");
    }
  }




  Future<bool>postParticipant(Map<String, dynamic> params, String memberId) async {
    try {
      final String baseUrl = dotenv.get('postparticipant');
      final response = await http.post(
        Uri.parse("$baseUrl$memberId"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );



      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        debugPrint('response of post participant : $jsonResponse');

       
        return true;
      } else {
        // final errorResponse = jsonDecode(response.body);
        // String errorMessage = '';
        // errorResponse['error'].forEach((k, v) {
        //   errorMessage += '$k: ${v.join(', ')}\n';
        // });

        debugPrint('error at 77 in post participant: ${jsonDecode(response.body)} ,  ');

        return false;
      }
    } catch (e) {
      debugPrint('error in catch of post participant : $e');
      return false;
    }
  }




   Future<MemberCreateResponseModel> postMember(Map<String, dynamic> params) async {
    try {
      final String baseUrl = dotenv.get('postmember');
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(params),
      );
    debugPrint(" member got ${response.statusCode}");


      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        debugPrint('response of  post member : $jsonResponse');

       
        return MemberCreateResponseModel.fromJson(jsonResponse);
      } else {
        

        debugPrint('error at 118 in post member: ${jsonDecode(response.body)} ,  ');

        return MemberCreateResponseModel(memberId: "", message: "");
      }
    } catch (e) {
      print('error in catch of post member : $e');
      return MemberCreateResponseModel(memberId: "", message: "");
    }
  }
}
