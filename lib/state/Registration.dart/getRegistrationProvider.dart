import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/api/Registartion/fetchRegistration.dart';
import 'package:major_project__widget_testing/api/get_prefilled_data.dart';
import 'package:major_project__widget_testing/api/get_teamDetails.dart';
import 'package:major_project__widget_testing/api/post_team_registeration.dart';
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
      form: FormModel(id: "", hackthon: "", numberOfFields: 0),
      fields: [],
      sections: []);

  int _selectedParticipantTab = -1;

  int get selectedParticipantTab => _selectedParticipantTab;

  final List<dynamic> _gereralSectionFieldsList = [
    ShortAnswerFieldModel(
        id: "",
        errorText: "Please fill the name",
        hint: "Enter your name",
        label: "Full name",
        required: true,
        serialNumber: 1,
        validation: "String",
        type: FieldTypes.shortAnswer),
    ShortAnswerFieldModel(
        id: "",
        errorText: "Plrase enter your email",
        hint: "Enter your valid email id",
        label: "Email id ",
        required: true,
        serialNumber: 2,
        validation: "Email",
        type: FieldTypes.shortAnswer),
    ShortAnswerFieldModel(
        id: "",
        errorText: "Please enter your college",
        hint: "Enter your College/ Organization Name",
        label: "College Name",
        required: true,
        serialNumber: 3,
        validation: "String",
        type: FieldTypes.shortAnswer),
    DropDownModel(
      id: "",
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
        id: "",
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
        id: "",
        serialNumber: 1,
        label: "Team Name",
        errorText: "This field is required",
        required: true,
        type: FieldTypes.shortAnswer,
        validation: "String",
        hint: "Enter your team name"),
  ];

  void addModelInTeamDetailsList(dynamic input) {
    _teamDetailsSectionFieldsList.add(input);
    notifyListeners();
  }

  final List<dynamic> _teamEmailList = [];
  List<dynamic> get teamEmailList => _teamEmailList;

  void addTeamFields(int index) {
    _teamEmailList.add(
      ShortAnswerFieldModel(
          id: "",
          serialNumber: 1,
          label: "Participant ${index + 1} email",
          errorText: "This field is required",
          required: true,
          type: FieldTypes.shortAnswer,
          validation: "Email",
          hint: "Please enter your participant ${index + 1} email"),
    );
    notifyListeners();
  }

  TeamRegisterationModel _teamData = TeamRegisterationModel(
      team: TeamModel(teamName: "", teamSize: 0), members: []);

  int _sectionsCount = 0;

  int get sectionsCount => _sectionsCount;

  void setSectionsCount(int value) {
    _sectionsCount = value;
    notifyListeners();
  }

  int _initiallMemberIndex = 0;

  int get initialmemberIndex => _initiallMemberIndex;

  void setInitiallMemberIndex(int value) {
    _initiallMemberIndex = value;
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
            additionalData: List.generate(_singleForm.fields.length, (index) {
              return getAnswerModel(_singleForm.fields[index].type,
                  _singleForm.fields[index], index);
            }))
      ]
    });

    _teamData.members.add(member);
    notifyListeners(); // Notifies all listening widgets of a change.
  }

  bool isMemberDataComplete(int index) {
    TeamRegisterationModel model = _teamData;
    if (index >= model.members.length) {
      print("Index out of bounds.");
      return false;
    }

    MemberModel member = model.members[index];

    bool isComplete = true;
    var value = member.details.values.toList()[0];

    if (value is List<MemberDataModel>) {
      // It's a list of MemberDataModel

      for (MemberDataModel dataModel in value) {
        // Check required data fields
        if (dataModel.requiredData.participantName.isEmpty ||
            dataModel.requiredData.participantEmail.isEmpty ||
            dataModel.requiredData.participantPhone.trim().isEmpty ||
            dataModel.requiredData.participantGender.isEmpty ||
            dataModel.requiredData.participantCollege.isEmpty) {
          isComplete = false;
          return false; // exits the entire function
        }

        // Check additional data fields based on type
        for (var additionalData in dataModel.additionalData) {
          if ((additionalData is StringAnswerModel ||
                  additionalData is OneIntAnswerModel ||
                  additionalData is BoolAnswerModel) &&
              additionalData.input.isEmpty) {
            isComplete = false;
            return false; // exits the entire function
          } else if ((additionalData is MapAnswerModel ||
                  additionalData is MapIntAnswerModel) &&
              additionalData.input.isEmpty) {
            isComplete = false;
            return false; // exits the entire function
          } else if (additionalData is TwoIntAnswerModel &&
              additionalData.input1.isEmpty &&
              additionalData.input2.isEmpty) {
            isComplete = false;
            return false; // exits the entire function
          }
        }
      }
    } else {
      print("im inelse kyuuuuuuuuuuuuuuu $value");
      // If any other data type needs to be validated, add here.
      if (value.toString().isEmpty) {
        isComplete = false;
        return false; // exits the entire function
      }
    }

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
          form: FormModel(id: "", hackthon: "", numberOfFields: 0),
          fields: [],
          sections: []);

      print("else $_singleForm");
    }

    notifyListeners();
  }

  Future<void> getPrefilledData(
    String email,
    int index,
  ) async {
    print("********$index");
    final response = await GetPrefilledData().getprefilledData(email);
    print("Im in usertype fun");

    if (response != null) {
      print(
          "Im in usertype fun response not null ${response.email}, ${response.firstName}, ${response.gender}, ${response.lastName},${response.organisation}, ${response.phone}");
      _teamData.members[index].details[email][0].requiredData.participantName =
          "${response.firstName} ${response.lastName}";
      _teamData.members[index].details[email][0].requiredData.participantEmail =
          response.email;
      _teamData.members[index].details[email][0].requiredData.participantPhone =
          response.phone;
      _teamData.members[index].details[email][0].requiredData
          .participantCollege = response.organisation;
      _teamData.members[index].details[email][0].requiredData
          .participantGender = response.gender;
    } else {
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
    print("_sectionsCount in provider ${_sectionsCount}");
    getformcontroller = TabController(length: _sectionsCount, vsync: _vsync);
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

  void updateDetails(String input,
      {int? serialNumber,
      String? modelType,
      String? isRequiredData,
      String? requiredType}) async {
    MemberDataModel model =
        _teamData.members[selectedParticipantTab].details.values.toList()[0][0];

    print("input in provider *********** $input, $serialNumber, $modelType");

    if (isRequiredData != null && requiredType != null) {
      if (isRequiredData == "GeneralData") {
        if (requiredType == "phone") {
          model.requiredData.participantPhone = input;
        } else if (requiredType == "email") {
          model.requiredData.participantEmail = input;
        }
      } else if (isRequiredData == "TeamData") {
        if (requiredType == "teamname") {
          _teamData.team.teamName = input;
        } else if (requiredType == "teamsize") {
          _teamData.team.teamSize = int.tryParse(input) ?? 0;
          print(
              "***************** teamm size ${_teamData.team.teamSize}, ${teamEmailList.length}***********************888");

          if (teamEmailList.isEmpty) {
            print("adding all");
            for (int i = 1; i < _teamData.team.teamSize; i++) {
              addTeamFields(i);
              addMember("Member ${i + 1}", false);
            }
          } else if (_teamData.team.teamSize - 1 > teamEmailList.length) {
            //team size= 7 old size= 4 (members= 3)
            //6
            //6>3
            //7-1-3=6-3=3
            int count = _teamData.team.teamSize - 1 - teamEmailList.length;
            print("  count $count");
            for (int i = 0; i < count; i++) {
             
                print("adding one");
                addTeamFields(teamEmailList.length + 1);
                addMember("Member ${teamEmailList.length + 1}", false);
             
            }
          } else if (_teamData.team.teamSize - 1 < teamEmailList.length) {
            print("let's remove");
            int count = teamEmailList.length - (_teamData.team.teamSize - 1);
            for (int i = 0;
                i <count;
                i++) {
              print("removing last");
              teamEmailList.removeLast();
              _teamData.members.removeLast();
            }
          } else {
            print("what the fuck is going on");
          }
        }
      } else if (isRequiredData == "MemberEmails") {
        int index = int.tryParse(requiredType) ?? 1;

        MemberModel member = MemberModel(details: {
          input: [
            MemberDataModel(
                requiredData: RequiredDataModel(
                    participantEmail: "",
                    participantName: "",
                    participantPhone: "",
                    participantGender: "",
                    participantCollege: ""),
                isLeader: false,
                additionalData:
                    List.generate(_singleForm.fields.length, (index) {
                  return getAnswerModel(_singleForm.fields[index].type,
                      _singleForm.fields[index], index);
                }))
          ]
        });

        _teamData.members[index] = member;
        _teamData.members[index].details[input][0].requiredData
            .participantEmail = input;
        await getPrefilledData(input, index);
      }
    } else if (serialNumber != null && modelType != null) {
      if (modelType == "StringAnswerModel" ||
          modelType == "OneIntAnswerModel" ||
          modelType == "BoolAnswerModel") {
        model.additionalData[serialNumber].input = input;
      } else if (modelType == "MapAnswerModel") {
        //  if(input.contains(','))
        // {

        List<String> options = input.split(',');

        Map<String, String> optionList = {};

        for (int i = 0; i < options.length; i++) {
          optionList["Option ${i + 1}"] = options[i];
        }

        model.additionalData[serialNumber].input = optionList;

        print(
            " after updation map: ${model.additionalData[serialNumber].input}");
        // }else{
        //   model.additionalData[serialNumber].input = {
        //   'Option 1': input,
        // };
        // }
      }
      if (modelType == "TwoIntAnswerModel") {
        List<String> values = input.split(',');
        model.additionalData[serialNumber].input1 = values[0];
        model.additionalData[serialNumber].input2 = values[1];
      }
    }

    notifyListeners();
    
     WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  

   final ScrollController scrollController = ScrollController();

  void scrollToEnd() {
    print("scrolling");
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  dynamic getField(
      {required FieldTypes type,
      required dynamic field,
      required String initialAnswer,
      required bool isDisabled,
      int? serialNumber,
      String? modelType,
      String? isRequiredData,
      String? requiredType}) {
    switch (type) {
      case FieldTypes.date:
        return 0;
      case FieldTypes.file:
        return 0;
      case FieldTypes.longAnswer:
        print('initial long answer in provider $initialAnswer');
        return LongAnsField(
          create: false,
          hint: field.hint,
          isDisabled: isDisabled,
          error: field.errorText,
          limit: field.wordLimit,
          question: field.label,
          required: field.required,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          initialAnswer: initialAnswer,
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
          required: field.required,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
        );
      case FieldTypes.shortAnswer:
        return ShortAnsField(
          create: false,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
          error: field.errorText,
          hint: field.hint,
          question: field.label,
          required: field.required,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          validation: field.validation,
        );
      case FieldTypes.stepper:
        return StepperField(
          create: false,
          max: field.max_value,
          min: field.min_value,
          question: field.label,
          required: field.required,
          error: field.errorText,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
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
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
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
          required: field.required,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
        );
      case FieldTypes.toggle:
        return ToogleYNField(
          create: false,
          error: field.errorText,
          question: field.label,
          required: field.required,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
        );
      case FieldTypes.phoneNumber:
        print(' phone value ${initialAnswer}');
        return PhoneField(
          question: field.label,
          create: false,
          initialAnswer: initialAnswer,
          isDisabled: isDisabled,
          required: field.required,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
        );
      case FieldTypes.slider:
        return SliderField(
          create: false,
          min: field.labels[field.labels.keys.first],
          max: field.labels[field.labels.keys.last],
          labels: field.labels.keys.toList(),
          required: field.required,
          question: field.label,
          error: field.errorText,
          isRequiredData: isRequiredData,
          requiredType: requiredType,
          serialNumber: serialNumber,
          modelType: modelType,
          isDisabled: isDisabled,
          initialAnswer: initialAnswer,
        );
      default:
        throw Exception('Invalid field type');
    }
  }

  dynamic getAnswerModel(FieldTypes type, dynamic field, int index) {
    switch (type) {
      case FieldTypes.date:
        return StringAnswerModel(
            input: "",
            serialNumber: index,
            question: field.label,
            type: FieldTypes.date);
      case FieldTypes.longAnswer:
        return StringAnswerModel(
            input: "",
            serialNumber: index,
            question: field.label,
            type: FieldTypes.longAnswer);

      case FieldTypes.radio:
        return MapAnswerModel(
            input: {},
            serialNumber: index,
            question: field.label,
            type: FieldTypes.radio);

      case FieldTypes.dropdown:
        return MapAnswerModel(
            input: {},
            serialNumber: index,
            question: field.label,
            type: FieldTypes.dropdown);
      case FieldTypes.shortAnswer:
        return StringAnswerModel(
            input: "",
            serialNumber: index,
            question: field.label,
            type: FieldTypes.shortAnswer);
      case FieldTypes.stepper:
        return OneIntAnswerModel(
            input: "", //TODO
            serialNumber: index,
            question: field.label,
            type: FieldTypes.stepper);
      case FieldTypes.range:
        return TwoIntAnswerModel(
            input1: "", //TODO
            input2: "", //TODO
            serialNumber: index,
            question: field.label,
            type: FieldTypes.range);

      case FieldTypes.slider:
        return OneIntAnswerModel(
            input: "", //TODO
            serialNumber: index,
            question: field.label,
            type: FieldTypes.slider);
      case FieldTypes.tag:
        return MapAnswerModel(
            input: {},
            serialNumber: index,
            question: field.label,
            type: FieldTypes.tag);

      case FieldTypes.linear:
        return OneIntAnswerModel(
            input: "", //TODO
            serialNumber: index,
            question: field.label,
            type: FieldTypes.linear);
      case FieldTypes.phoneNumber:
        return StringAnswerModel(
            input: "",
            serialNumber: index,
            question: field.label,
            type: FieldTypes.phoneNumber);
      case FieldTypes.checkbox:
        return MapAnswerModel(
          input: {},
          serialNumber: index,
          question: field.label,
          type: FieldTypes.checkbox,
        );

      case FieldTypes.toggle:
        return BoolAnswerModel(
            input: "",
            serialNumber: index,
            question: field.label,
            type: FieldTypes.toggle);

      default:
        throw Exception('Invalid field type $type');
    }
  }

  Future<String> createTeam(String hackathonId) async {
    List<String> memberEmailsList = [];

    for (int i = 1; i < _teamData.members.length; i++) {
      memberEmailsList.add(_teamData.members[i].details.keys.toList()[0]);
    }
    Map<String, dynamic> params = {
      "team": {
        "hackathon": hackathonId,
        "team_name": _teamData.team.teamName,
        "number_of_member": _teamData.team.teamSize
      },
      "leader": {"email": _teamData.members[0].details.keys.toList()[0]},
      "emails": memberEmailsList
    };

    print("params of team $params");
    final result = await CreateTeam().postTeam(params);

    return result.leader;
  }

  Future<String> createMember(String teamId, int index) async {
    String participantEmail = _teamData.members[index].details.values
        .toList()[0][0]
        .requiredData
        .participantEmail;

    Map<String, dynamic> params = {"user": participantEmail, "team": teamId};

    print("params of member $params");

    final result = await CreateTeam().postMember(params);

    return result.memberId;
  }

  Future<bool> createParticipant(int index, String memberId) async {
    String getType(FieldTypes type) {
      switch (type) {
        case FieldTypes.checkbox:
          return "multiple_field";
        case FieldTypes.shortAnswer:
          return "short_field";
        case FieldTypes.dropdown:
          return "dropdown_field";

        case FieldTypes.date:
          return "date_field";
        case FieldTypes.file:
          return "file_field";
        case FieldTypes.longAnswer:
          return "long_field";

        case FieldTypes.radio:
          return "multiple_field";
        case FieldTypes.linear:
          return "slider";
        case FieldTypes.range:
          return "slider";

        case FieldTypes.stepper:
          return "stepper_field";
        case FieldTypes.tag:
          return "tags_field";
        case FieldTypes.toggle:
          return "toggle";

        case FieldTypes.slider:
          return "slider";
        case FieldTypes.phoneNumber:
          return "phone";
        default:
          return "";
      }
    }

    RequiredDataModel requiredData =
        _teamData.members[index].details.values.toList()[0][0].requiredData;
    List<dynamic> additionalData =
        _teamData.members[index].details.values.toList()[0][0].additionalData;
    Map<String, dynamic> params = {
      "required": {
        "form": _singleForm.form.id,
        "participant_name": requiredData.participantName,
        "participant_email": requiredData.participantEmail,
        "participant_phone": requiredData.participantPhone,
        "participant_gender": requiredData.participantGender
      },
      "additional": List.generate(additionalData.length, (index) {
        Map<String, dynamic> additionalDataJson =
            additionalData[index].toJson();

        String newKey = getType(_singleForm.fields[index].type);

        additionalDataJson[newKey] = _singleForm.fields[index].id;
        return additionalDataJson;
      })
    };

    debugPrint("params participant $params");
    bool result = await CreateTeam().postParticipant(params, memberId);
    return result;
  }

  Future<void> getTeamDetails(
    String teamId,
  ) async {
    final response = await GetTeamDetails().getTeamDetails(teamId);
    debugPrint("Im in get team details function");

    if (response != null) {
      debugPrint("Im in get team details function response not null ");
      _teamData = response;
      print("api executed");
    } else {}
    notifyListeners();
  }

  void initializeMemberDataListToMembers() {
    List<MemberModel> membersList = _teamData.members;
    for (MemberModel member in membersList) {
      String emailKey = member.details.keys.toList()[0];
      if (member.details[emailKey] is! List) {
        String value = member.details[emailKey];
        member.details[emailKey] = [
          MemberDataModel(
              requiredData: RequiredDataModel(
                  participantEmail:
                      value == "pendin" ? member.details[emailKey] : "",
                  participantName: "",
                  participantPhone: "",
                  participantGender: "",
                  participantCollege: ""),
              isLeader: false,
              additionalData: List.generate(_singleForm.fields.length, (index) {
                return getAnswerModel(_singleForm.fields[index].type,
                    _singleForm.fields[index], index);
              }))
        ];
      }
    }
    debugPrint("initialized members also");
    notifyListeners();
  }

  int findMemberIndex(String emailId) {
    List<MemberModel> members = _teamData.members;
    for (int i = 0; i < members.length; i++) {
      if (members[i].details.containsKey(emailId)) {
        return i; // Return the index where 'group' key is found
      }
    }
    return -1; // Return -1 if 'group' key is not found
  }
}




// cae9be78-910b-4fd4-82c6-22a547fce01c
