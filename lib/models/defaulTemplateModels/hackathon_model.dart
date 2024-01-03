class Hackathon {
  final String? logo;
  final String name;
  final String organisationName;
  final String modeOfConduct;
  final String deadline;
  final int teamSize;
  final String visible;
  final String startDateTime;
  final String about;
  final String brief;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String website;
  final String fee;
  final String venue;
  final String contact1Name;
  final int contact1Number;
  final String contact2Name;
  final int contact2Number;

  Hackathon({
    this.logo,
    required this.name,
    required this.organisationName,
    required this.modeOfConduct,
    required this.deadline,
    required this.teamSize,
    required this.visible,
    required this.startDateTime,
    required this.about,
    required this.brief,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    required this.website,
    required this.fee,
    required this.venue,
    required this.contact1Name,
    required this.contact1Number,
    required this.contact2Name,
    required this.contact2Number,
  });

  factory Hackathon.fromJson(Map<String, dynamic> json) => Hackathon(
        logo: json['logo'],
        name: json['name'],
        organisationName: json['organisation_name'],
        modeOfConduct: json['mode_of_conduct'],
        deadline: json['deadline'],
        teamSize: json['team_size'],
        visible: json['visible'],
        startDateTime: json['start_date_time'],
        about: json['about'],
        brief: json['brief'],
        image1: json['image1'],
        image2: json['image2'],
        image3: json['image3'],
        image4: json['image4'],
        image5: json['image5'],
        website: json['website'],
        fee: json['fee'],
        venue: json['venue'],
        contact1Name: json['contact1_name'],
        contact1Number: json['contact1_number'],
        contact2Name: json['contact2_name'],
        contact2Number: json['contact2_number'],
      );

  Map<String, dynamic> toJson() => {
        'logo': logo,
        'name': name,
        'organisation_name': organisationName,
        'mode_of_conduct': modeOfConduct,
        'deadline': deadline,
        'team_size': teamSize,
        'visible': visible,
        'start_date_time': startDateTime,
        'about': about,
        'brief': brief,
        'image1': image1,
        'image2': image2,
        'image3': image3,
        'image4': image4,
        'image5': image5,
        'website': website,
        'fee': fee,
        'venue': venue,
        'contact1_name': contact1Name,
        'contact1_number': contact1Number,
        'contact2_name': contact2Name,
        'contact2_number': contact2Number,
      };
}

class Round {
  final int serialNumber;
  final String name;
  final String description;
  final String startTimeline;
  final String endTimeline;

  Round({
    required this.serialNumber,
    required this.name,
    required this.description,
    required this.startTimeline,
    required this.endTimeline,
  });

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      serialNumber: json['serial_number'],
      name: json['name'],
      description: json['description'],
      startTimeline: json['start_timeline'],
      endTimeline: json['end_timeline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serial_number': serialNumber,
      'name': name,
      'description': description,
      'start_timeline': startTimeline,
      'end_timeline': endTimeline,
    };
  }
}

class TextFieldProperties {
  TextFieldProperties();
  factory TextFieldProperties.fromJson(Map<String, dynamic> json) {
    return TextFieldProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ContainerProperties {
 ContainerProperties();
  factory ContainerProperties.fromJson(Map<String, dynamic> json) {
    return ContainerProperties();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
  }
