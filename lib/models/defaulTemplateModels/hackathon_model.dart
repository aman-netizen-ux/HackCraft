class Hackathon {
  String id;
  String? logo;
  String name;
  String organisationName;
  String modeOfConduct;
  String deadline;
  String teamSize;
  String visible;
  String startDateTime;
  String about;
  String brief;
 // List<String> images;
  String website;
  String fee;
  String venue;
  String contact1Name;
  String contact1Number;
  String contact2Name;
  String contact2Number;
  String totalRounds;
  Hackathon({
    required this.id,
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
 //   required this.images,
    required this.website,
    required this.fee,
    required this.venue,
    required this.contact1Name,
    required this.contact1Number,
    required this.contact2Name,
    required this.contact2Number,
    required this.totalRounds
  });

  factory Hackathon.fromJson(Map<String, dynamic> json) => Hackathon(
        id: json['_id'],
        logo: json['logo'],
        name: json['name'],
        organisationName: json['organisation_name'],
        modeOfConduct: json['mode_of_conduct'],
        deadline: json['deadline'],
        teamSize: json['team_size'].toString(),
        visible: json['visible'],
        startDateTime: json['start_date_time'],
        about: json['about'],
        brief: json['brief'],
        //images: List<String>.from(json['images']),
        website: json['website'],
        fee: json['fee'],
        venue: json['venue'],
        contact1Name: json['contact1_name'],
        contact1Number: json['contact1_number'].toString(),
        contact2Name: json['contact2_name'],
        contact2Number: json['contact2_number'].toString(),
        totalRounds: json['total_number_rounds'].toString()
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
      //  'images': images,
        'website': website,
        'fee': fee,
        'venue': venue,
        'contact1_name': contact1Name,
        'contact1_number': contact1Number,
        'contact2_name': contact2Name,
        'contact2_number': contact2Number,
        'total_number_rounds': totalRounds
      };
}

class Round {
  int serialNumber;
  String name;
  String description;
  String startTimeline;
  String endTimeline;

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

/////// TEXT PROPERTIES PART IS THERE 

class TextFieldProperties {
  String font;
  int size;
  String textColor;
  int fontWeight;
  bool italics;
  bool underline;
  bool strikethrogh;
  bool upperCase;
  String align;
  int letterSpacing;

  TextFieldProperties(
      {
        required this.font,
      required this.size,
      required this.textColor,
      required this.fontWeight,
      required this.italics,
      required this.underline,
      required this.strikethrogh,
      required this.upperCase,
      required this.align,
      required this.letterSpacing
      });

  factory TextFieldProperties.fromJson(Map<String, dynamic> json) {
    return TextFieldProperties(
      font: json['font'],
      size: json['size'],
      textColor: json['text_color'],
      fontWeight: json['font_weight'],
      italics: json['italics'],
      underline: json['underline'],
      strikethrogh: json['strikethrogh'],
      upperCase: json['upper_case'],
      align: json['align'],
      letterSpacing: json['letter_spacing'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'font': font,
      'size': size,
      'text_color': textColor,
      'font_weight': fontWeight,
      'italics': italics,
      'underline': underline,
      'strikethrogh': strikethrogh,
      'upper_case': upperCase,
      'align': align,
      'letter_spacing': letterSpacing
    };
  }
}

class TextFieldPropertiesArray {
  String type;
  String name;
  TextFieldProperties textProperties;
  TextFieldPropertiesArray({
    required this.type,
    required this.textProperties,
    required this.name
  });
  factory TextFieldPropertiesArray.fromJson(Map<String, dynamic> json) {
    return TextFieldPropertiesArray(
        textProperties: TextFieldProperties.fromJson(json['properties']),
        name: json['name'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type,
    'name': name, 'properties': textProperties.toJson()};
  }
}


/////// CONTAINER PROPERTIES PART IS THERE 

class ContainerProperties {
  String borderColor;
  int height;
  int borderWidth;
  String color;
  String focusedBorderColor;
  double borderRadius;
  double blurRadius;
  String boxShadowColor;
  //border_radius is remaining

  ContainerProperties(
      {
        required this.borderColor,
        required this.focusedBorderColor,
      required this.height,
      required this.color,
      required this.borderWidth,
      required this.borderRadius,
      required this.blurRadius,
      required this.boxShadowColor
      });

  factory ContainerProperties.fromJson(Map<String, dynamic> json) {
    return ContainerProperties(
      borderColor: json['border_color'],
      height: json['height'],
      color: json['Color'],
      borderWidth: json['border_width'], focusedBorderColor: json['focused_border_color'],
      blurRadius: json['blur_radius'],
      borderRadius: json['border_radius'],
      boxShadowColor: json['box_shadow_color']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'border_color': borderColor,
      'height': height,
      'Color': color,
      'border_width': borderWidth,
      'focused_color': focusedBorderColor,
      'blur_radius': blurRadius,
      'border_radius': borderRadius,
      'box_shadow_color': boxShadowColor
    };
  }
}



class ContainerPropertiesArray {
  String type;
  String name;
  ContainerProperties containerProperties;
  ContainerPropertiesArray({
    required this.type,
    required this.containerProperties,
    required this.name
  });
  factory ContainerPropertiesArray.fromJson(Map<String, dynamic> json) {
    return ContainerPropertiesArray(
      containerProperties: ContainerProperties.fromJson(json['properties']),
        name: json['name'],
        type: json['type']
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type,
    'name': name, 'properties': containerProperties.toJson()};
  }
}

class LimitContainerHeight{
  int minHeight;
  int maxHeight;

  LimitContainerHeight({required this.minHeight, required this.maxHeight});
  
}
