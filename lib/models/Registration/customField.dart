class CustomField {
  String id;
  String label;
  String type;
  List<String> options;

  CustomField(
      {required this.id,
      required this.label,
      required this.type,
      this.options = const []});

  factory CustomField.fromJson(Map<String, dynamic> json) {
    List<String> multipleChoice = [];
    if (json['multiple_choice'] != null) {
      multipleChoice = (json['multiple_choice'] as List)
          .map((choice) => choice['option'] as String)
          .toList();
    }

    return CustomField(
      id: json['_id'],
      label: json['label'],
      type: json['type'],
      options: multipleChoice,
    );
  }
}
