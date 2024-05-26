class HackathonModel {
  final String id;
  final String logo;
  final String organisation;
  final String name;
  final String startDate;
  final String endDate;
  final int numberOfRegistrations;

  HackathonModel({
    required this.id,
    required this.logo,
    required this.organisation,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.numberOfRegistrations,
  });

  factory HackathonModel.fromJson(Map<String, dynamic> json) {
    return HackathonModel(
      id: json['_id'],
      logo: json['logo'] ?? '', 
      organisation: json['organisation'],
      name: json['name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      numberOfRegistrations: json['number_of_registerations'],
    );
  }
}
