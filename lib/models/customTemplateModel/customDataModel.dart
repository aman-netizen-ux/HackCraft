class HackathonDetails {
  String id;
  String logo;
  String name;
  String organisationName;

  String deadline;
  List<int> teamSize;
  String startDateTime;
  String brief;

  String fee;

  String totalRounds;
  HackathonDetails(
      {required this.id,
      required this.logo,
      required this.name,
      required this.organisationName,
      required this.deadline,
      required this.teamSize,
      required this.startDateTime,
      required this.brief,
      required this.fee,
      required this.totalRounds});

  factory HackathonDetails.fromJson(Map<String, dynamic> json) =>
      HackathonDetails(
          id: json['_id'],
          logo: json['logo'],
          name: json['name'],
          organisationName: json['organisation_name'],
          deadline: json['deadline'],
          teamSize: List<int>.from(json['team_size']),
          startDateTime: json['start_date_time'],
          brief: json['brief'],
          fee: json['fee'],
          totalRounds: json['total_number_rounds'].toString());

  Map<String, dynamic> toJson() => {
        'logo': logo,
        'name': name,
        'organisation_name': organisationName,
        'deadline': deadline,
        'team_size': teamSize,
        'start_date_time': startDateTime,
        'brief': brief,
        'fee': fee,
        'total_number_rounds': totalRounds
      };
}

class CustomData {
  Map<String, dynamic> widget;

  String modeOfConduct;

  String venue;
  CustomData(
      {required this.widget, required this.modeOfConduct, required this.venue});

  factory CustomData.fromJson(Map<String, dynamic> json) => CustomData(
        widget: Map<String, dynamic>.from(json['widget']),
        modeOfConduct: json['mode_of_conduct'],
        venue: json['venue'],
      );

  Map<String, dynamic> toJson() =>
      {'brief': widget, 'fee': modeOfConduct, 'total_number_rounds': venue};
}
