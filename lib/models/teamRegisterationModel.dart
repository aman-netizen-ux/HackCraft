// class TeamRegisterationModel {
//    TeamModel team;
//    List<MemberModel> member;

//   TeamRegisterationModel({
//     required this.team,
//     required this.member,
//   });

//   factory TeamRegisterationModel.fromJson(Map<String, dynamic> json) {
//     var membersList = json['members'] as List;
//     List<MemberModel> members = membersList.map((memberJson) => MemberModel.fromJson(memberJson)).toList();
//     return TeamRegisterationModel(
//         team: TeamModel.fromJson(json['team']),
//         member: members);
//   }

  
// }


// class TeamModel {
//    String teamName;
//    int teamSize;

//   TeamModel({
//     required this.teamName,
//     required this.teamSize,
//   });

//   factory TeamModel.fromJson(Map<String, dynamic> json) {
//     return TeamModel(
//         teamName: json['team_name'],
//         teamSize: json['number_of_member']);
//   }

  
// }

// class MemberModel {
//    Map<String, List<MemberDataModel>> details;

//   MemberModel({
//     required this.details,
//   });

//   // factory MemberModel.fromJson(Map<String, dynamic> json) {
//   //   // Remove the fixed key and store all keys in the map
//   //   return MemberModel(details: json.map((key, value) => MapEntry(key, value.toString())));
//   // }

//   factory MemberModel.fromJson(Map<String, dynamic> json) {
//     var detailMap = <String, List<MemberDataModel>>{};
//     json.forEach((key, value) {
//       // Assuming value is a list of maps representing MemberDataModels
//       List<MemberDataModel> dataList = (value as List)
//           .map((item) => MemberDataModel.fromJson(item as Map<String, dynamic>))
//           .toList();
//       detailMap[key] = dataList;
//     });
//     return MemberModel(details: detailMap);
//   }
// }


// class MemberDataModel{
//  RequiredDataModel requiredData;
//  bool isLeader;
//  List<dynamic> additionalData;

// MemberDataModel({
// required this.requiredData,
// required this.isLeader,
// required this.additionalData,
// });

// factory MemberDataModel.fromJson(Map<String, dynamic> json) {
//     return MemberDataModel(
//         requiredData: RequiredDataModel.fromJson(json['required_data']),
//         isLeader: json['is_leader'],
//         additionalData:List<dynamic>.from(json['additional_data'].map((x) => AdditionalDataModel.fromJson(x))),
       
//         );
//   }

// }


// class RequiredDataModel{
//  String participantEmail;
//  String participantName;
//  String participantPhone;
//  String participantGender;
//  String participantCollege;

// RequiredDataModel({
// required this.participantEmail, 
// required this.participantName, 
// required this.participantPhone,
// required  this.participantGender, 
// required this.participantCollege, 
// });

// factory RequiredDataModel.fromJson(Map<String, dynamic> json) {
//     return RequiredDataModel(
//         participantName: json['participant_name'],
//          participantEmail: json['participant_email'],
//           participantPhone: json['participant_phone'],
//            participantGender: json['participant_gender'],
//             participantCollege: json['participant_college'],
//         );
//   }

// }



// class AdditionalDataModel{

//   String question;
//   String typr;

//   AdditionalDataModel({});
// }
