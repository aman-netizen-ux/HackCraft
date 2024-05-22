class UserTypeModel {
  final String role;
  final String message;

  UserTypeModel({
    required this.role,
    required this.message,
  });

  factory UserTypeModel.fromJson(Map<String, dynamic> json) {
    return UserTypeModel(
        role: json['role'],
        message: json['message']);
  }

  
}
