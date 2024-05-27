class UserTypeModel {
  final String role;
  final String message;
  final String teamId;

  UserTypeModel( {
    required this.role,
    required this.message,
    required this.teamId,
  });

  factory UserTypeModel.fromJson(Map<String, dynamic> json) {
    return UserTypeModel(
        role: json['role'],
        message: json['message'], teamId: json['team']);
  }

  
}
