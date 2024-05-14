class UserRegisteredHackathons {
  final List<RegisteredHackathon> hackathons;

  UserRegisteredHackathons({required this.hackathons});

  factory UserRegisteredHackathons.fromJson(List<dynamic> jsonList) {
    List<RegisteredHackathon> hackathons = jsonList
        .map((json) => RegisteredHackathon.fromJson(json))
        .toList();
    return UserRegisteredHackathons(hackathons: hackathons);
  }
}

class RegisteredHackathon {
  final String name;
  final String hackathonHostDate;
  final String userRegisteredDate;
  final String organizationName;
  final String teamName;
  final String hackathonDeadline;
  final String tag;

  RegisteredHackathon({
    required this.name,
    required this.hackathonHostDate,
    required this.userRegisteredDate,
    required this.organizationName,
    required this.teamName,
    required this.hackathonDeadline,
    required this.tag
  });

  factory RegisteredHackathon.fromJson(Map<String, dynamic> json) {
    return RegisteredHackathon(
      name: json['hackathon_name'],
      hackathonHostDate: json['hackathon_host_date'],
      userRegisteredDate: json['registered_on'],
      organizationName: json['organisation'],
      teamName: json['team'],
      hackathonDeadline: json['hackathon_deadline'],
      tag: json['tag']
    );
  }
}
