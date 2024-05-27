class TeamCreateResponseModel {
 
  final String leader;

  TeamCreateResponseModel({
 
    required this.leader,
  });

  factory TeamCreateResponseModel.fromJson(Map<String, dynamic> json) {
    return TeamCreateResponseModel(
     
        leader: json['leader']);
  }

  
}
