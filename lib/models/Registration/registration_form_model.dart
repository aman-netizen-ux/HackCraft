import 'package:major_project__widget_testing/constants/enums.dart';

class RegistrationFormModel {
  FormModel form;
  // String hackathon;
  List<dynamic> fields;
  List<Section> sections;

  RegistrationFormModel({
    required this.form,
    // required this.hackathon,
    required this.fields,
    required this.sections,
  });

  factory RegistrationFormModel.fromJson(Map<String, dynamic> json) {
    return RegistrationFormModel(
      form: FormModel.fromJson(json['form']),
      // hackathon: json['hackathon'],
      fields:
          List<dynamic>.from(json['fields'].map((x) => FieldModel.fromJson(x))),
      sections:
          List<Section>.from(json['sections'].map((x) => Section.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'form': form.toJson(),
      //'hackathon': hackathon,
      'fields': fields.map((x) => x.toJson()).toList(),
      'sections': sections.map((x) => x.toJson()).toList(),
    };
  }
}

class FormModel {
  int numberOfFields;
  String hackthon;

  FormModel({required this.hackthon, required this.numberOfFields});

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      hackthon: json['hackathon'],
      numberOfFields: json['number_of_fields'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'hackathon': hackthon,
      'number_of_fields': numberOfFields,
    };
  }
}

class FieldModel {
  // String id;
  // String created;
  int serialNumber;
  String label;
  String errorText;
  bool required;
  // String form;
  FieldTypes type;

  FieldModel({
    // required this.id,
    // required this.created,
    required this.serialNumber,
    required this.label,
    required this.errorText,
    required this.required,
    // required this.form,
    required this.type,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      // case 'date':
      //   return DateFieldModel.fromJson(json);
      // case 'file':
      //   return FileFieldModel.fromJson(json);
      case 'longAnswer':
        return LongAnswerFieldModel.fromJson(json);
      case 'radio':
        return RadioFieldModel.fromJson(json);
      case 'shortAnswer':
        return ShortAnswerFieldModel.fromJson(json);
      case 'stepper':
        return StepperModel.fromJson(json);
      case 'range':
        return RangeModel.fromJson(json);
      case 'slider':
        return SliderModel.fromJson(json);
      case 'tag':
        return TagModel.fromJson(json);
      case 'linear':
        return LinearModel.fromJson(json);
      // case 'phone':
      //   return PhoneNumberModel.fromJson(json);
      case 'checkbox':
        return CheckBoxModel.fromJson(json);
      case 'toggle':
        return ToggleModel.fromJson(json);
       case 'dropdown':
        return DropDownModel.fromJson(json);
      default:
        throw Exception('Invalid field type ${json['type']}');
    }
  }
}

class RegistrationOption {
  String text;
  int serialNumber;

  RegistrationOption({
    required this.text,
    required this.serialNumber,
  });

  factory RegistrationOption.fromJson(Map<String, dynamic> json) {
    return RegistrationOption(
      text: json['text'],
      serialNumber: json['serial_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'serial_number': serialNumber,
    };
  }
}

class DateFieldModel extends FieldModel {
  String minDate;
  String maxDate;

  DateFieldModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.minDate,
    required this.maxDate,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory DateFieldModel.fromJson(Map<String, dynamic> json) {
    return DateFieldModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      minDate: json['min_date'],
      maxDate: json['max_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'min_date': minDate,
      'max_date': maxDate,
    };
  }
}

class FileFieldModel extends FieldModel {
  String hint;
  FileFieldModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.hint,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory FileFieldModel.fromJson(Map<String, dynamic> json) {
    return FileFieldModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      hint: json['hint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
    };
  }
}

class LongAnswerFieldModel extends FieldModel {
  int wordLimit;
  String hint;
  LongAnswerFieldModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required this.hint,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.wordLimit,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory LongAnswerFieldModel.fromJson(Map<String, dynamic> json) {
    return LongAnswerFieldModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      wordLimit: json['word_limit'],
      hint: json['hint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      'hint': hint,
      'type': type.toString().split('.').last,
      'word_limit': wordLimit,
    };
  }
}

class RadioFieldModel extends FieldModel {
  List<RegistrationOption> options;

  RadioFieldModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.options,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory RadioFieldModel.fromJson(Map<String, dynamic> json) {
    return RadioFieldModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type:FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      options: List<RegistrationOption>.from(
        json['options'].map((optionJson) => RegistrationOption.fromJson(optionJson)))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'options':options.map((option) => option.toJson()).toList(),
    };
  }
}

class CheckBoxModel extends FieldModel {
  List<RegistrationOption> options;

  CheckBoxModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.options,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory CheckBoxModel.fromJson(Map<String, dynamic> json) {
    return CheckBoxModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      options: List<RegistrationOption>.from(
        json['options'].map((optionJson) => RegistrationOption.fromJson(optionJson)))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'options':options.map((option) => option.toJson()).toList(),
    };
  }
}

class ShortAnswerFieldModel extends FieldModel {
  String validation;
  String hint;

  ShortAnswerFieldModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.validation,
    required this.hint,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory ShortAnswerFieldModel.fromJson(Map<String, dynamic> json) {
    return ShortAnswerFieldModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      validation: json['validation'],
      hint: json['hint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'validation': validation,
      'hint': hint,
    };
  }
}

class TagModel extends FieldModel {
  List<String> options;
  TagModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.options,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory TagModel.fromJson(Map<String, dynamic> json) {
    List<String> options = [];
    if (json['options'] != null) {
      json['options'].forEach((option) {
        options.add(option['text']);
      });
    }
    return TagModel(
        // id: json['_id'],
        // created: json['created'],
        serialNumber: json['serial_number'],
        label: json['label'],
        errorText: json['error_text'] ?? '',
        required: json['required'] ?? false,
        // form: json['form'],
        type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
        options: options);
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'options': options.map((option) => {'text': option}).toList(),
    };
  }
}

class StepperModel extends FieldModel {
  int min_value;
  int max_value;
  StepperModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.max_value,
    required this.min_value,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory StepperModel.fromJson(Map<String, dynamic> json) {
    return StepperModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      min_value: json['min_value'],
      max_value: json['max_value'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
     
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      'max_value': max_value,
       'min_value': min_value,
      'type': type.toString().split('.').last,
    };
  }
}

class RangeModel extends FieldModel {
  Map<String, int> labels;
  RangeModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.labels,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory RangeModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> labelsJson = json['labels'];
    Map<String, int> labels = {};
    labelsJson.forEach((key, value) {
      labels[key] = value;
    });
    return RangeModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      labels: labels,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      'labels': labels,
      'type': type.toString().split('.').last,
    };
  }
}

class LinearModel extends FieldModel {
  Map<String, int> labels;
  LinearModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.labels,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory LinearModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> labelsJson = json['labels'];
    Map<String, int> labels = {};
    labelsJson.forEach((key, value) {
      labels[key] = value;
    });
    return LinearModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      labels: labels,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'labels': labels,
    };
  }
}

class SliderModel extends FieldModel {
  Map<String, int> labels;
  SliderModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.labels,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> labelsJson = json['labels'];
    Map<String, int> labels = {};
    labelsJson.forEach((key, value) {
      labels[key] = value;
    });
    return SliderModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      labels: labels,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      'labels': labels,
      'type': type.toString().split('.').last,
    };
  }
}

class ToggleModel extends FieldModel {
  ToggleModel({
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    required FieldTypes type,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory ToggleModel.fromJson(Map<String, dynamic> json) {
    return ToggleModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
    };
  }
}

class DropDownModel extends FieldModel {
  List<RegistrationOption> options;
  DropDownModel({
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    required FieldTypes type,
    required this.options,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory DropDownModel.fromJson(Map<String, dynamic> json) {
    return DropDownModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      options: List<RegistrationOption>.from(
        json['options'].map((optionJson) => RegistrationOption.fromJson(optionJson)))
    );
  }
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'options':options.map((option) => option.toJson()).toList(),
    };
  }
}

class PhoneNumberModel extends FieldModel {
  String validation;
  String hint;

  PhoneNumberModel({
    // required String id,
    // required String created,
    required int serialNumber,
    required String label,
    required String errorText,
    required bool required,
    // required String form,
    required FieldTypes type,
    required this.validation,
    required this.hint,
  }) : super(
          // id: id,
          // created: created,
          serialNumber: serialNumber,
          label: label,
          errorText: errorText,
          required: required,
          // form: form,
          type: type,
        );

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) {
    return PhoneNumberModel(
      // id: json['_id'],
      // created: json['created'],
      serialNumber: json['serial_number'],
      label: json['label'],
      errorText: json['error_text'] ?? '',
      required: json['required'] ?? false,
      // form: json['form'],
      type: FieldTypes.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      validation: json['validation'],
      hint: json['hint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      // 'created': created,
      'serial_number': serialNumber,
      'label': label,
      'error_text': errorText,
      'required': required,
      // 'form': form,
      'type': type.toString().split('.').last,
      'validation': validation,
      'hint': hint,
    };
  }
}

class Section {
  String id;
  String created;
  int serialNumber;
  String sectionName;
  int numberOfQuestions;
  String form;

  Section({
    required this.id,
    required this.created,
    required this.serialNumber,
    required this.sectionName,
    required this.numberOfQuestions,
    required this.form,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['_id'],
      created: json['created'],
      serialNumber: json['serial_number'],
      sectionName: json['section_name'],
      numberOfQuestions: json['number_of_questions'],
      form: json['form'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'created': created,
      'serial_number': serialNumber,
      'section_name': sectionName,
      'number_of_questions': numberOfQuestions,
      'form': form,
    };
  }
}
