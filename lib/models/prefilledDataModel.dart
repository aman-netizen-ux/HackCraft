class PrefilledDataModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String gender;
  final String organisation;

  PrefilledDataModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.gender,
    required this.organisation,
  });

  // Convert a PrefilledDataModel instance into a Map. Useful for encoding to JSON.
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'gender': gender,
      'organisation': organisation,
    };
  }

  // Creates a new PrefilledDataModel instance from a map structure. Useful for decoding from JSON.
  static PrefilledDataModel fromJson(Map<String, dynamic> json) {
    return PrefilledDataModel(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      gender: json['gender'],
      organisation: json['organisation'],
    );
  }
}
