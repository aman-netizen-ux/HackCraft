import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/api/Registartion/fetchRegistration.dart';
import 'package:major_project__widget_testing/api/get_prefilled_data.dart';
import 'package:major_project__widget_testing/constants/enums.dart';
import 'package:major_project__widget_testing/models/Registration/customField.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';
import 'package:major_project__widget_testing/models/teamRegisterationModel.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/checkbox_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/dropdown_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/linearScale_field.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/long_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/multipleChoice_field.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/phone_filed.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/rangeSlider_field.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/short_ans.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/slider_field.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/stepper_field.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/tag_field.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/RegFieldsCollection/toggle_yn_field.dart';

var logger = Logger();

//This provider is for the registration section.
class GetRegistrationFormProvider with ChangeNotifier {
  List<CustomField> _customFields = [];
  List<CustomField> get customFields => _customFields;

  Map<String, dynamic> _formData = {};
  Map<String, dynamic> get formData => _formData;

  Future<void> getRegForm(String uId) async {
    try {
      var response = await ApiService().getRegistration(uId);

      if (response.containsKey('form') && response['form'].isNotEmpty) {
        _formData = response['form'][0];
      } else {
        logger.i("Form data is empty or not found");
      }

      if (response.containsKey('custom_fields')) {
        if (response['custom_fields'] != null &&
            response['custom_fields'].isNotEmpty) {
          _customFields = (response['custom_fields'] as List)
              .map((field) => CustomField.fromJson(field))
              .toList();
          notifyListeners();
        } else {
          logger.i("Custom fields are empty or null");
        }
      } else {
        logger.i("Custom fields key not found in response");
      }
    } catch (e) {
      logger.e("Error fetching registration form: $e");
    }
  }

  //newCode

  // List<String> sections=["abc", "wow", "ok", "nice"];
  final TickerProvider _vsync;
  TabController getformcontroller;

  RegistrationFormModel _singleForm = RegistrationFormModel(
      form: FormModel(hackthon: "", numberOfFields: 0),
      fields: [],
      sections: []);

  int _selectedParticipantTab = -1;

  int get selectedParticipantTab => _selectedParticipantTab;

  final List<dynamic> _gereralSectionFieldsList = [
   
    ShortAnswerFieldModel(
        errorText: "Please fill the name",
        hint: "Enter your name",
        label: "Full name",
        required: true,
        serialNumber: 1,
        validation: "String",
        type: FieldTypes.shortAnswer),
    ShortAnswerFieldModel(
        errorText: "Plrase enter your email",
        hint: "Enter your valid email id",
        label: "Email id ",
        required: true,
        serialNumber: 2,
        validation: "Email",
        type: FieldTypes.shortAnswer),
    ShortAnswerFieldModel(
        errorText: "Please enter your college",
        hint: "Enter your College Name",
        label: "College Name",
        required: true,
        serialNumber: 3,
        validation: "String",
        type: FieldTypes.shortAnswer),
    DropDownModel(
      serialNumber: 4,
      label: "Gender",
      errorText: "Please select you gender",
      required: true,
      type: FieldTypes.dropdown,
      options: [
        RegistrationOption(text: "Male ", serialNumber: 1),
        RegistrationOption(text: "Female ", serialNumber: 2),
        RegistrationOption(text: "Other ", serialNumber: 3)
      ],
    ),
    PhoneNumberModel(
        serialNumber: 5,
        label: "Phone Number",
        errorText: "Please enter your Phone Number",
        required: true,
        type: FieldTypes.phoneNumber,
        validation: "PhoneNumber",
        hint: "Enter Your 10-digit number")
  ];

  final List<dynamic> _teamDetailsSectionFieldsList = [
    ShortAnswerFieldModel(
        serialNumber: 1,
        label: "Team Name",
        errorText: "lease enter your Team Name",
        required: true,
        type: FieldTypes.shortAnswer,
        validation: "String",
        hint: "Enter your team name"),
    StepperModel(
        serialNumber: 1,
        label: "Team Member",
        errorText: "Please enter your team member",
        required: true,
        type: FieldTypes.stepper,
        max_value: 5,
        min_value: 0)
  ];

  TeamRegisterationModel _teamData = TeamRegisterationModel(
      team: TeamModel(teamName: "", teamSize: 0), members: []);

  int _sectionsCount=0;

  int get sectionsCount=> _sectionsCount;

  void setSectionsCount(int value){
    _sectionsCount=value;
    notifyListeners();
  }

  TeamRegisterationModel get teamData => _teamData;

  void setTeamData(TeamRegisterationModel value) {
    _teamData = value;
    notifyListeners();
  }

  // Method to update the team details
  void updateTeam(String teamName, int teamSize) {
    _teamData.team.teamName = teamName;
    _teamData.team.teamSize = teamSize;
    notifyListeners(); // Notifies all listening widgets of a change.
  }

  // Method to add a member
  void addMember(String emailId, bool isLeader) {
    MemberModel member = MemberModel(details: {
      emailId: [
        MemberDataModel(
            requiredData: RequiredDataModel(
                participantEmail: "",
                participantName: "",
                participantPhone: "",
                participantGender: "",
                participantCollege: ""),
            isLeader: isLeader,
            additionalData: List.generate(
              _singleForm.fields.length, (index) {
                getAnswerModel(_singleForm.fields[index].type, _singleForm.fields[index], index);
              }))
      ]
    });

    _teamData.members.add(member);
    notifyListeners(); // Notifies all listening widgets of a change.
  }


  bool isMemberDataComplete( int index) {
    TeamRegisterationModel model= _teamData;
  if (index >= model.members.length) {
    print("Index out of bounds.");
    return false;
  }

  MemberModel member = model.members[index];
  bool isComplete = true;

  // Loop through each key in the member details
  member.details.forEach((key, value) {
    if (value is List<MemberDataModel>) {
      // It's a list of MemberDataModel
      for (MemberDataModel dataModel in value) {
        // Check required data fields
        if (dataModel.requiredData.participantName.isEmpty ||
            dataModel.requiredData.participantEmail.isEmpty ||
            dataModel.requiredData.participantPhone.isEmpty ||
            dataModel.requiredData.participantGender.isEmpty ||
            dataModel.requiredData.participantCollege.isEmpty) {
          isComplete = false;
          return;
        }

        // Check additional data fields based on type
        for (var additionalData in dataModel.additionalData) {
          if (additionalData is StringAnswerModel && additionalData.input.isEmpty) {
            isComplete = false;
            return;
          } else if (additionalData is OneIntAnswerModel && additionalData.input == null) {
            isComplete = false;
            return;
          } else if (additionalData is TwoIntAnswerModel && (additionalData.input1 == null || additionalData.input2 == null)) {
            isComplete = false;
            return;
          } else if (additionalData is BoolAnswerModel && additionalData.input == null) {
            isComplete = false;
            return;
          } else if (additionalData is MapAnswerModel && additionalData.input.isEmpty) {
            isComplete = false;
            return;
          }
        }
      }
    } else {
      // If any other data type needs to be validated, add here.
      if (value.toString().isEmpty) {
        isComplete = false;
        return;
      }
    }
  });

  return isComplete;
}


  List<dynamic> get gereralSectionFieldsList => _gereralSectionFieldsList;
  List<dynamic> get teamDetailsSectionFieldsList =>
      _teamDetailsSectionFieldsList;

  void setSelectedParticipantTab(int value) {
    _selectedParticipantTab = value;
    notifyListeners();
  }

  RegistrationFormModel get singleForm => _singleForm;
  Future<void> getHackathonForm(String id) async {
    final response = await GetRegistratioForm().getRegistratioForm(id);
    if (response != null && response is RegistrationFormModel) {
      _singleForm = response;
      print("if $_singleForm");
    } else {
      _singleForm = RegistrationFormModel(
          form: FormModel(hackthon: "", numberOfFields: 0),
          fields: [],
          sections: []);

      print("else $_singleForm");
    }

    notifyListeners();
  }

Future<void> getPrefilledData( String email, int index,)async {
    final response= await GetPrefilledData().getprefilledData(email);
    print("Im in usertype fun");

    if(response!=null){
       print("Im in usertype fun response not null ${response.email}, ${response.firstName}, ${response.gender}, ${response.lastName},${response.organisation}, ${response.phone}");
      _teamData.members[index].details[email][0].requiredData.participantName= "${response.firstName} ${response.lastName}";
       _teamData.members[index].details[email][0].requiredData.participantEmail=response.email;
         _teamData.members[index].details[email][0].requiredData.participantPhone=response.phone;
           _teamData.members[index].details[email][0].requiredData.participantCollege=response.organisation;
             _teamData.members[index].details[email][0].requiredData.participantGender=response.gender;
       
    }else{
      print("some problem ocurred in getting prefilled data");
    }
    notifyListeners();
  }
  GetRegistrationFormProvider(this._vsync)
      : getformcontroller = TabController(length: 0, vsync: _vsync) {
    initialize();
    print(" initial controller");
  }

  Future<void> initialize() async {
//  isInitialized = true;
    _createTabController();
    notifyListeners();
  }

  // This function is used to create a new tabcontroller
  void _createTabController() {
    // int count = _selectedParticipantTab == 0 ? 2 : 1;
    // print(
    //     "_selectedParticipantTab in create tab controller $_selectedParticipantTab  tidk $count");

    getformcontroller = TabController(
        length: _sectionsCount, vsync: _vsync);
    getformcontroller.addListener(() {
      if (!getformcontroller.indexIsChanging) {
        notifyListeners();
      }
    });
  }

  Future<void> refreshTabs() async {
    getformcontroller.dispose();
    // print("inrefresh $_selectedParticipantTab");
    _createTabController();
    notifyListeners();
  }

  dynamic getField(FieldTypes type, dynamic field) {
    switch (type) {
      case FieldTypes.date:
        return 0;
      case FieldTypes.file:
        return 0;
      case FieldTypes.longAnswer:
        return LongAnsField(
          create: false,
          hint: field.hint,
          error: field.errorText,
          limit: field.wordLimit,
          question: field.label,
          required: field.required,
        );
      case FieldTypes.radio || FieldTypes.yesNo:
        List<RegistrationOption> options =
            field.options.cast<RegistrationOption>();

        List<String> textList = options.map((option) => option.text).toList();
        return MultipleChoiceField(
            question: field.label,
            create: false,
            error: field.errorText,
            options: textList,
            required: field.required);
      case FieldTypes.shortAnswer:
        return ShortAnsField(
            create: false,
            error: field.errorText,
            hint: field.hint,
            question: field.label,
            required: field.required);
      case FieldTypes.stepper:
        return StepperField(
          create: false,
          max: field.max_value,
          min: field.min_value,
          question: field.label,
          required: field.required,
        );
      case FieldTypes.range:
        //TODO:check min max of this
        return RangeSliderField(
          create: false,
          labels: field.labels.keys.toList(),
          required: field.required,
          max: field.labels.values.last,
          min: field.labels.values.first,
          question: field.label,
          error: field.errorText,
        );
      case FieldTypes.tag:
        return TagField(
            question: field.label,
            options: field.options,
            create: false,
            error: field.errorText,
            required: field.required);
      case FieldTypes.linear:
        return LinearScaleField(
            create: false,
            required: field.required,
            labels: field.labels.keys.toList(),
            division: field.labels.length,
            error: field.errorText,
            min: field.labels[field.labels.keys.first],
            max: field.labels[field.labels.keys.last],
            question: field.label);
      case FieldTypes.dropdown:
        List<RegistrationOption> options =
            field.options.cast<RegistrationOption>();

        List<String> textList = options.map((option) => option.text).toList();
        return DropDownField(
          error: field.errorText,
          create: false,
          question: field.label,
          required: field.required,
          options: textList,
        );
      case FieldTypes.checkbox:
        List<RegistrationOption> options =
            field.options.cast<RegistrationOption>();

        List<String> textList = options.map((option) => option.text).toList();
        return CheckBoxField(
            question: field.label,
            create: false,
            error: field.errorText,
            options: textList,
            required: field.required);
      case FieldTypes.toggle:
        return ToogleYNField(
          create: false,
          error: field.errorText,
          question: field.label,
          required: field.required,
        );
      case FieldTypes.phoneNumber:
        return PhoneField(
            question: field.label, create: false, required: field.required);
      case FieldTypes.slider:
        return SliderField(
          create: false,
          min: field.labels[field.labels.keys.first],
          max: field.labels[field.labels.keys.last],
          labels: field.labels.keys.toList(),
          required: field.required,
          question: field.label,
          error: field.errorText,
        );
      default:
        throw Exception('Invalid field type');
    }
  }

  dynamic getAnswerModel(FieldTypes type, dynamic field, int index){
    switch(type){
      case FieldTypes.date:
        return StringAnswerModel(
          input: "",
          serialNumber: index,
          question: field.label,
          type: FieldTypes.date
        );
        case FieldTypes.longAnswer:
        return  StringAnswerModel(
          input: "",
          serialNumber: index,
          question: field.label,
          type: FieldTypes.longAnswer
        );

         case FieldTypes.radio:
        return  MapAnswerModel(
          input: {},
          serialNumber: index,
          question: field.label,
          type: FieldTypes.radio
        );
         case FieldTypes.shortAnswer:
        return  StringAnswerModel(
          input: "",
          serialNumber: index,
          question: field.label,
          type: FieldTypes.shortAnswer
        );
         case FieldTypes.stepper:
        return  OneIntAnswerModel(
          input: -1,
          serialNumber: index,
          question: field.label,
          type: FieldTypes.stepper
        );
         case FieldTypes.range:
        return  TwoIntAnswerModel(
          input1: -1,
          input2: -1,
          serialNumber: index,
          question: field.label,
          type: FieldTypes.range
        );

         case FieldTypes.slider:
        return  OneIntAnswerModel(
          input: -1,
          serialNumber: index,
          question: field.label,
          type: FieldTypes.slider
        );
         case FieldTypes.tag:
        return MapAnswerModel(
          input: {},
          serialNumber: index,
          question: field.label,
          type: FieldTypes.tag
        );

         case FieldTypes.linear:
        return  OneIntAnswerModel(
          input: -1,
          serialNumber: index,
          question: field.label,
          type: FieldTypes.linear
        );
         case FieldTypes.phoneNumber:
        return StringAnswerModel(
          input: "",
          serialNumber: index,
          question: field.label,
          type: FieldTypes.phoneNumber
        );
         case FieldTypes.checkbox:
        return MapAnswerModel(
          input: {},
          serialNumber: index,
          question: field.label,
          type: FieldTypes.checkbox
        );

         case FieldTypes.toggle:
        return  BoolAnswerModel(
          input: false,
          serialNumber: index,
          question: field.label,
          type: FieldTypes.toggle
        );
      default:
        throw Exception('Invalid field type');
    }
  }
}

// cae9be78-910b-4fd4-82c6-22a547fce01c
