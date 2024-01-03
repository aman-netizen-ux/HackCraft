class CustomField {
  String id;
  String label;
  Map<String, dynamic>? shortAns;
  List<dynamic> multiple;
  List<String> options;

  CustomField({
    required this.id,
    required this.label,
    required this.shortAns,
    required this.multiple,
    this.options = const [],
  });

  factory CustomField.fromJson(Map<String, dynamic> json) {
    // Extracting the text field from the short_answer object
    Map<String, dynamic>? shortAnswerMap;
    if (json['short_answer'] != null) {
      shortAnswerMap = json['short_answer'] as Map<String, dynamic>;
    }

    // Extracting multiple choice options
    List<String> multipleChoiceOptions = [];
    if (json['multiple_choice'] != null) {
      multipleChoiceOptions = (json['multiple_choice'] as List)
          .map((choice) => choice['option'] as String)
          .toList();
    }

    return CustomField(
      id: json['_id'],
      label: json['label'],
      shortAns: shortAnswerMap,
      multiple: json['multiple_choice'],
      options: multipleChoiceOptions,
    );
  }
}
