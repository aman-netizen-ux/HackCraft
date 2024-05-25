import 'package:major_project__widget_testing/constants/enums.dart';

class TeamRegisterationModel {
  TeamModel team;
  List<MemberModel> members;

  TeamRegisterationModel({
    required this.team,
    required this.members,
  });

  factory TeamRegisterationModel.fromJson(Map<String, dynamic> json) {
    var membersList = json['members'] as List;
    List<MemberModel> members = membersList
        .map((memberJson) => MemberModel.fromJson(memberJson))
        .toList();
    return TeamRegisterationModel(
        team: TeamModel.fromJson(json['team']), members: members);
  }

  Map<String, dynamic> toJson() {
    return {
      'team': team.toJson(),
      'members': members.map((member) => member.toJson()).toList(),
    };
  }
}

class TeamModel {
  String teamName;
  int teamSize;

  TeamModel({
    required this.teamName,
    required this.teamSize,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
        teamName: json['team_name'], teamSize: json['number_of_member']);
  }

   Map<String, dynamic> toJson() {
    return {
      'team_name': teamName,
      'number_of_member': teamSize,
    };
  }
}

class MemberModel {
  // This can be a map with dynamic values to handle different structures.
  Map<String, dynamic> details;

  MemberModel({
    required this.details,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> detailMap = {};
    json.forEach((key, value) {
      if (value is List) {
        // Check if the items in the list are map (which indicates a group of MemberDataModel)
        if (value.isNotEmpty && value.first is Map) {
          // Parse it as a list of MemberDataModel
          detailMap[key] = value
              .map((item) =>
                  MemberDataModel.fromJson(item as Map<String, dynamic>))
              .toList();
        } else {
          // It's a list but not of maps, store directly
          detailMap[key] = value;
        }
      } else {
        // It's not a list, store the value directly (e.g., string)
        detailMap[key] = value;
      }
    });
    return MemberModel(details: detailMap);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    details.forEach((key, value) {
      if (value is List) {
        // Check if the items in the list are instances of MemberDataModel
        if (value.isNotEmpty && value.first is MemberDataModel) {
          // Serialize it as a list of MemberDataModel
          json[key] = value.map((item) => (item as MemberDataModel).toJson()).toList();
        } else {
          // It's a list but not of MemberDataModel, store directly
          json[key] = List.from(value);
        }
      } else {
        // It's not a list, store the value directly
        json[key] = value;
      }
    });
    return json;
  }
}

class MemberDataModel {
  RequiredDataModel requiredData;
  bool isLeader;
  List<dynamic> additionalData;

  MemberDataModel({
    required this.requiredData,
    required this.isLeader,
    required this.additionalData,
  });

  factory MemberDataModel.fromJson(Map<String, dynamic> json) {
    return MemberDataModel(
      requiredData: RequiredDataModel.fromJson(json['required_data']),
      isLeader: json['is_leader'],
      additionalData: List<dynamic>.from(
          json['additional_data'].map((x) => AdditionalDataModel.fromJson(x))),
    );
  }
Map<String, dynamic> toJson() {
    return {
      'required_data': requiredData.toJson(),
      'is_leader': isLeader,
      'additional_data': additionalData.map((x) => x.toJson()).toList(),
    };
  }
   
}

class RequiredDataModel {
  String participantEmail;
  String participantName;
  String participantPhone;
  String participantGender;
  String participantCollege;

  RequiredDataModel({
    required this.participantEmail,
    required this.participantName,
    required this.participantPhone,
    required this.participantGender,
    required this.participantCollege,
  });

  factory RequiredDataModel.fromJson(Map<String, dynamic> json) {
    return RequiredDataModel(
      participantName: json['participant_name'],
      participantEmail: json['participant_email'],
      participantPhone: json['participant_phone'],
      participantGender: json['participant_gender'],
      participantCollege: json['participant_college'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'participant_name': participantName,
      'participant_email': participantEmail,
       'participant_phone': participantPhone,
      'participant_gender': participantGender,
       'participant_college': participantCollege,
    };
  }
}

class AdditionalDataModel {
  String question;
  FieldTypes type;
  int serialNumber;

  AdditionalDataModel(
      {required this.question, required this.type, required this.serialNumber});

  factory AdditionalDataModel.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'date':
        return StringAnswerModel.fromJson(json);
      // case 'file':
      //   return FileFieldAnswerModel.fromJson(json);
      case 'longAnswer':
        return StringAnswerModel.fromJson(json);
      case 'radio':
        return MapAnswerModel.fromJson(json);
      case 'shortAnswer':
        return StringAnswerModel.fromJson(json);
      case 'stepper':
        return OneIntAnswerModel.fromJson(json);
      case 'range': 
        return TwoIntAnswerModel.fromJson(json);
      case 'slider':
        return OneIntAnswerModel.fromJson(json);
      case 'tag':
        return MapAnswerModel.fromJson(json);
      case 'linear':
        return OneIntAnswerModel.fromJson(json); //TODO: need to update  and as well in get regprovider
      case 'phone':
        return StringAnswerModel.fromJson(json);
      case 'check':
        return MapAnswerModel.fromJson(json);
      case 'toggle':
        return BoolAnswerModel.fromJson(json);
      case 'dropdown':
        return MapAnswerModel.fromJson(json); //TODO: need to update and as well in get regprovider
      default:
        throw Exception('Invalid field type');
    }
  }
}

class StringAnswerModel extends AdditionalDataModel {
  String input;
  StringAnswerModel({
    required int serialNumber,
    required String question,
    required FieldTypes type,
    required this.input,
  }) : super(
          serialNumber: serialNumber,
          question: question,
          type: type,
        );

  factory StringAnswerModel.fromJson(Map<String, dynamic> json) {
    return StringAnswerModel(
      serialNumber: json['serial_number'],
      input: json['input'],
      type: FieldTypes.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      question: json['field'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    
      'serial_number': serialNumber,
      'field': question,
      'type': type.toString().split('.').last,
      'input': input,
    };
  }
}

class OneIntAnswerModel extends AdditionalDataModel {
  String input;
  OneIntAnswerModel({
    required int serialNumber,
    required String question,
    required FieldTypes type,
    required this.input,
  }) : super(
          serialNumber: serialNumber,
          question: question,
          type: type,
        );

  factory OneIntAnswerModel.fromJson(Map<String, dynamic> json) {
    return OneIntAnswerModel(
      serialNumber: json['serial_number'],
      input: json['input'].toString(),
      type: FieldTypes.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      question: json['field'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
     
      'serial_number': serialNumber,
      'field': question,
      'type': type.toString().split('.').last,
      'input': int.tryParse(input) ?? 0,
    };
  }
}

class TwoIntAnswerModel extends AdditionalDataModel {
  String input1;
  String input2;
  TwoIntAnswerModel({
    required int serialNumber,
    required String question,
    required FieldTypes type,
    required this.input1,
    required this.input2,
  }) : super(
          serialNumber: serialNumber,
          question: question,
          type: type,
        );

  factory TwoIntAnswerModel.fromJson(Map<String, dynamic> json) {
    return TwoIntAnswerModel(
      serialNumber: json['serial_number'],
      input1: json['input1'].toString(),
      input2: json['input2'].toString(),
      type: FieldTypes.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      question: json['field'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    
      'serial_number': serialNumber,
      'field': question,
      'type': type.toString().split('.').last,
      'input1': int.tryParse(input1) ?? 0,
      'input2': int.tryParse(input2) ?? 0,
    };
  }
}

class BoolAnswerModel extends AdditionalDataModel {
  String input;
  BoolAnswerModel({
    required int serialNumber,
    required String question,
    required FieldTypes type,
    required this.input,
  }) : super(
          serialNumber: serialNumber,
          question: question,
          type: type,
        );

  factory BoolAnswerModel.fromJson(Map<String, dynamic> json) {
    return BoolAnswerModel(
      serialNumber: json['serial_number'],
      input: json['input'],
      type: FieldTypes.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      question: json['field'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    
      'serial_number': serialNumber,
      'field': question,
      'type': type.toString().split('.').last,
      'input': input=="true",
    };
  }
}

class MapAnswerModel extends AdditionalDataModel {
  Map<String, String> input;
  MapAnswerModel({
    required int serialNumber,
    required String question,
    required FieldTypes type,
    required this.input,
  }) : super(
          serialNumber: serialNumber,
          question: question,
          type: type,
        );

  factory MapAnswerModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> inputsJson = json['input'];
    Map<String, String> input = {};
    inputsJson.forEach((key, value) {
      input[key] = value;
    });
    return MapAnswerModel(
      serialNumber: json['serial_number'],
      input: input,
      type: FieldTypes.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      question: json['field'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
     
      'serial_number': serialNumber,
      'field': question,
      'type': type.toString().split('.').last,
      'input': input,
    };
  }

  
}
class MapIntAnswerModel extends AdditionalDataModel {
  Map<String, String> input; // Change to Map<String, String>

  MapIntAnswerModel({
    required int serialNumber,
    required String question,
    required FieldTypes type,
    required this.input,
  }) : super(
          serialNumber: serialNumber,
          question: question,
          type: type,
        );

  factory MapIntAnswerModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> inputsJson = json['input'];
    Map<String, String> input = {};
    inputsJson.forEach((key, value) {
      input[key] = value.toString(); // Convert int to String
    });
    return MapIntAnswerModel(
      serialNumber: json['serial_number'],
      input: input,
      type: FieldTypes.values
          .firstWhere((e) => e.toString().split('.').last == json['type']),
      question: json['field'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> output = {};
    input.forEach((key, value) {
      output[key] = int.tryParse(value) ?? 0; // Convert String to int, default to 0 if not a valid int
    });
    return {
      'serial_number': serialNumber,
      'field': question,
      'type': type.toString().split('.').last,
      'input': output, // Now Map<String, int>
    };
  }
}
