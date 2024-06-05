class MemberCreateResponseModel {
 
  final String message;
  final String memberId;


  MemberCreateResponseModel({
 
    required this.message,required this.memberId,
  });

  factory MemberCreateResponseModel.fromJson(Map<String, dynamic> json) {
    return MemberCreateResponseModel(
     
        message: json['message'],memberId: json['member_id']);
        
  }

  
}
