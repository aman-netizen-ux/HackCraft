
import 'package:major_project__widget_testing/models/customTemplateModel/customDataModel.dart';

class CustomTemplateApiResponse {
   HackathonDetails hackathons;
   CustomData customData;

  CustomTemplateApiResponse({
    required this.hackathons,
   
    required this.customData,
  });

  factory CustomTemplateApiResponse.fromJson(Map<String, dynamic> json) => CustomTemplateApiResponse(
    hackathons: HackathonDetails.fromJson(json['hackathon']),
     customData: CustomData.fromJson(json['custom']),
    // rounds: List<Round>.from(json['round'].map((x) => Round.fromJson(x))),
    // fields: List<TextFieldPropertiesArray>.from(json['fields'].map((x) => TextFieldPropertiesArray.fromJson(x))),
    // containers: List<ContainerPropertiesArray>.from(json['containers'].map((x) => ContainerPropertiesArray.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'hackathon': hackathons.toJson(),
     'custom': customData.toJson(),
    
  };
}