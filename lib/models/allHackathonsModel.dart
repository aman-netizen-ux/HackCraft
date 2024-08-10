class HackathonModel {
  final String id;
  final String name;
  final String organisationName;
  final String modeOfConduct;
  final String startDate;
  final List<int> teamSize;
  final String venue;
  final String price;
  final String template;

  HackathonModel({
    required this.id,
    required this.name,
    required this.organisationName,
    required this.modeOfConduct,
    required this.startDate,
    required this.teamSize,
    required this.venue,
    required this.price,
    required this.template
  });

  factory HackathonModel.fromJson(Map<String, dynamic> json) {
    return HackathonModel(
        id: json['_id'],
        name: json['name'],
        organisationName: json['organisation_name'],
        modeOfConduct: json['mode_of_conduct'],
        startDate: json['start_date_time'],
        teamSize: List<int>.from(json['team_size']),
        venue: json['venue'],
        price: json['price'],
        template: json['template']);
  }
}
