class User {
  final String userType;
  final String firstName;
  final String organisationName;
  final String lastName;
  final String email;
  final int courseEndYear;
  final int percentage;
  final String gender;
  final String courseName;
  final String userName;
  final String city;
  final String dateOfBirth;
  final Interest interest;
  final String about;
  final String educationQualification;
  final String specialization;
  final List<String> skills;
  final SocialLinks socialLinks;



  User({
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.gender,
    required this.city,
    required this.organisationName,
    required this.courseName,
    required this.courseEndYear,
    required this.dateOfBirth,
    required this.interest,
    required this.about,
    required this.educationQualification,
    required this.specialization,
    required this.percentage,
    required this.socialLinks,
    required this.skills,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userType: json['user_type'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      userName: json['username'],
      gender: json['gender'],
      city: json['city'],
      organisationName: json['organisation'],
      courseName: json['cousrse_name'], // Corrected typo
      courseEndYear: json['course_end_year'],
      dateOfBirth: json['date_of_birth'],
      interest: Interest.fromJson(json['interest']),
      about: json['about'],
      educationQualification: json['education_qualification'],
      specialization: json['specialization'],
      percentage: json['percentage'],
      socialLinks: SocialLinks.fromJson(json),
      skills: List<String>.from(json['skill']),
    );
  }
}

class Interest {
  final List<String> key;

  Interest({required this.key});

  factory Interest.fromJson(Map<String, dynamic> json) {
    var keyList = List<String>.from(json['key'] ?? []);
    return Interest(
      key: keyList,
    );
  }
}

class SocialLinks {
  final String facebook;
  final String instagram;
  final String linkedin;
  final String github;
  final String medium;
  final String reddit;
  final String slack;
  final String dribble;
  final String behance;
  final String codepen;
  final String figma;

  SocialLinks({
    required this.facebook,
    required this.instagram,
    required this.linkedin,
    required this.github,
    required this.medium,
    required this.reddit,
    required this.slack,
    required this.dribble,
    required this.behance,
    required this.codepen,
    required this.figma,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
      facebook: json['facebook'],
      instagram: json['instagram'],
      linkedin: json['linkedin'],
      github: json['github'],
      medium: json['medium'],
      reddit: json['reddit'],
      slack: json['slack'],
      dribble: json['dribble'],
      behance: json['behance'],
      codepen: json['codepen'],
      figma: json['figma'],
    );
  }
}
