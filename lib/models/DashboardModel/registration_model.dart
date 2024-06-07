class Team {
  String teamName;
  int teamMemberCount;
  int teamCount;
  String registrationStatus;
  String registrationDate;
  String leader;
  List<String> allFields;
  List<Member> members;

  Team({
    required this.teamName,
    required this.teamMemberCount,
    required this.teamCount,
    required this.registrationStatus,
    required this.registrationDate,
    required this.leader,
    required this.allFields,
    required this.members,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    var membersList = json['members'] as List;
    List<Member> members = membersList.map((i) => Member.fromJson(i)).toList();

    return Team(
      teamName: json['team']['team_name'],
      teamMemberCount: json['team']['team_member_count'],
      teamCount: json['team']['team_count'],
      registrationStatus: json['team']['registeration_status'],
      registrationDate: json['team']['registeration_date'],
      leader: json['team']['leader'],
      allFields: List<String>.from(json['team']['all_fields']),
      members: members,
    );
  }
}
class Member {
  final String firstName;
  final String lastName;
  final bool isLeader;
  final Map<String, dynamic> submittedDetails;

  Member({
    required this.firstName,
    required this.lastName,
    required this.isLeader,
    required this.submittedDetails,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      firstName: json['user_first_name'],
      lastName: json['user_last_name'],
      isLeader: json['is_leader'],
      submittedDetails: Map<String, dynamic>.from(json['submited_details']),
    );
  }
}
