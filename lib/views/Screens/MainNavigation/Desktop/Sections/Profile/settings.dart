import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/state/profile-provider/profile_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/Profile/create_dropdown.dart';
import 'package:major_project__widget_testing/views/Components/Profile/create_fields.dart';
import 'package:major_project__widget_testing/views/Components/Profile/create_social_links.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Registation/updateUserProfile.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _XController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _mediumController = TextEditingController();
  final TextEditingController _redditController = TextEditingController();
  final TextEditingController _slackController = TextEditingController();
  final TextEditingController _dribbleController = TextEditingController();
  final TextEditingController _behanceController = TextEditingController();
  final TextEditingController _codepenController = TextEditingController();
  final TextEditingController _figmaController = TextEditingController();

  Map<String, dynamic> _originalData = {};
  String? _selectedGender;
  String? _selectedUserType;
  String? _selectedEducationalQualification;
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> userTypes = ['professional', 'student'];
  final List<String> educationalQualifications = [
    'Secondary',
    'Senior Secondary',
    'Associate\'s Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctorate (Ph.D.)',
    'Professional Degree (MD, JD, etc.)',
    'Other',
    'Select your educational qualification'
  ];
  List<Color> chipColors = [
    const Color(0xffffe2f7),
    const Color(0xffd9e6ff),
    const Color(0xffe7d3ff),
    const Color(0xffffddd2),
    const Color(0xffe2ebe5)
  ];
  List<Color> chipTextColors = [
    const Color(0xffe1319b),
    const Color(0xff518afa),
    const Color(0xff7537c5),
    const Color(0xffff7e55),
    const Color(0xff3e7e60)
  ];
  List<String> skills = [];
  List<String> interests = [];

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    final userProvider = Provider.of<ProfileProvider>(context, listen: false);
    super.initState();
    _loadUserData();
    if (userProvider.user!.email.isNotEmpty) {
      _emailController.text = userProvider.user!.email;
      setState(() {
        _originalData['email'] = userProvider.user!.email;
      });
    }
    if (userProvider.user!.firstName.isNotEmpty) {
      _firstNameController.text = userProvider.user!.firstName;
      setState(() {
        _originalData['first_name'] = userProvider.user!.firstName;
      });
    }
    if (userProvider.user!.lastName.isNotEmpty) {
      _lastNameController.text = userProvider.user!.lastName;
      setState(() {
        _originalData['last_name'] = userProvider.user!.lastName;
      });
    }
    if (userProvider.user!.gender.isNotEmpty) {
      setState(() {
        _selectedGender = userProvider.user!.gender;
        setState(() {
          _originalData['gender'] = userProvider.user!.gender;
        });
      });
    }
    if (userProvider.user!.userType.isNotEmpty) {
      setState(() {
        _selectedUserType = userProvider.user!.userType;
        setState(() {
          _originalData['user_type'] = userProvider.user!.userType;
        });
      });
    }
    if (userProvider.user!.educationQualification.isNotEmpty) {
      setState(() {
        _selectedEducationalQualification =
            userProvider.user!.educationQualification;
        setState(() {
          _originalData['education_qualification'] =
              userProvider.user!.educationQualification;
        });
      });
    }
    if (userProvider.user!.city.isNotEmpty) {
      _cityController.text = userProvider.user!.city;
      setState(() {
        _originalData['city'] = userProvider.user!.city;
      });
    }
    if (userProvider.user!.organisationName!.isNotEmpty) {
      _organizationController.text = userProvider.user!.organisationName!;
      setState(() {
        _originalData['organisation'] = userProvider.user!.organisationName;
      });
    }
    if (userProvider.user!.phone!.isNotEmpty) {
      _phoneController.text = userProvider.user!.phone!;
      setState(() {
        _originalData['phone'] = userProvider.user!.phone;
      });
    }
    if (userProvider.user!.dateOfBirth != null) {
      _dobController.text = userProvider.user!.dateOfBirth.toString();
      setState(() {
        _originalData['date_of_birth'] = userProvider.user!.dateOfBirth;
      });
    }
    if (userProvider.user!.about.isNotEmpty) {
      _aboutController.text = userProvider.user!.about;
      setState(() {
        _originalData['about'] = userProvider.user!.about;
      });
    }
    if (userProvider.user!.userName.isNotEmpty) {
      _usernameController.text = userProvider.user!.userName;
      setState(() {
        _originalData['username'] = userProvider.user!.userName;
      });
    }

    if (userProvider.user!.percentage != -1) {
      _percentageController.text = userProvider.user!.percentage.toString();
      setState(() {
        _originalData['percentage'] = userProvider.user!.percentage;
      });
    }

    if (userProvider.user!.degree!.isNotEmpty) {
      _degreeController.text = userProvider.user!.degree!;
      setState(() {
        _originalData['degree'] = userProvider.user!.degree;
        _originalData['specialization'] = userProvider.user!.degree;
      });
    }

    if (userProvider.user!.courseEndYear != -1) {
      _durationController.text = userProvider.user!.courseEndYear.toString();
      setState(() {
        _originalData['course_end_year'] = userProvider.user!.courseEndYear;
      });
    }

    if (userProvider.user!.courseName!.isNotEmpty) {
      _courseController.text = userProvider.user!.courseName!;
      setState(() {
        _originalData['cousrse_name'] = userProvider.user!.courseName;
        _originalData['specialization'] = userProvider.user!.courseName;
      });
    }

    if (userProvider.user!.socialLinks.facebook.isNotEmpty) {
      _facebookController.text = userProvider.user!.socialLinks.facebook;
      setState(() {
        _originalData['facebook'] = userProvider.user!.socialLinks.facebook;
      });
    }

    if (userProvider.user!.socialLinks.X.isNotEmpty) {
      _XController.text = userProvider.user!.socialLinks.X;
      setState(() {
        _originalData['x'] = userProvider.user!.socialLinks.X;
      });
    }

    if (userProvider.user!.skills.isNotEmpty) {
      setState(() {
        skills = List.from(userProvider.user!.skills);
        _originalData['skill'] = userProvider.user!.skills;
      });
    }

    if (!userProvider.user!.interest.isEmpty()) {
      setState(() {
        interests = List.from(userProvider.user!.interest.key);
        List<String> temp = List.from(userProvider.user!.interest.key);
        _originalData['interest'] = {'key': temp};
      });
    }

    if (userProvider.user!.socialLinks.instagram.isNotEmpty) {
      _instagramController.text = userProvider.user!.socialLinks.instagram;
      setState(() {
        _originalData['instagram'] = userProvider.user!.socialLinks.instagram;
      });
    }

    if (userProvider.user!.socialLinks.linkedin.isNotEmpty) {
      _linkedInController.text = userProvider.user!.socialLinks.linkedin;
      setState(() {
        _originalData['linkedin'] = userProvider.user!.socialLinks.linkedin;
      });
    }

    if (userProvider.user!.socialLinks.github.isNotEmpty) {
      _githubController.text = userProvider.user!.socialLinks.github;
      setState(() {
        _originalData['github'] = userProvider.user!.socialLinks.github;
      });
    }

    if (userProvider.user!.socialLinks.medium.isNotEmpty) {
      _mediumController.text = userProvider.user!.socialLinks.medium;
      setState(() {
        _originalData['medium'] = userProvider.user!.socialLinks.medium;
      });
    }

    if (userProvider.user!.socialLinks.reddit.isNotEmpty) {
      _redditController.text = userProvider.user!.socialLinks.reddit;
      setState(() {
        _originalData['reddit'] = userProvider.user!.socialLinks.reddit;
      });
    }

    if (userProvider.user!.socialLinks.slack.isNotEmpty) {
      _slackController.text = userProvider.user!.socialLinks.slack;
      setState(() {
        _originalData['slack'] = userProvider.user!.socialLinks.slack;
      });
    }
    if (userProvider.user!.socialLinks.dribble.isNotEmpty) {
      _dribbleController.text = userProvider.user!.socialLinks.dribble;
      setState(() {
        _originalData['dribble'] = userProvider.user!.socialLinks.dribble;
      });
    }
    if (userProvider.user!.socialLinks.behance.isNotEmpty) {
      _behanceController.text = userProvider.user!.socialLinks.behance;
      setState(() {
        _originalData['behance'] = userProvider.user!.socialLinks.behance;
      });
    }

    if (userProvider.user!.socialLinks.codepen.isNotEmpty) {
      _codepenController.text = userProvider.user!.socialLinks.codepen;
      setState(() {
        _originalData['codepen'] = userProvider.user!.socialLinks.codepen;
      });
    }

    if (userProvider.user!.socialLinks.figma.isNotEmpty) {
      _figmaController.text = userProvider.user!.socialLinks.figma;
      setState(() {
        _originalData['figma'] = userProvider.user!.socialLinks.figma;
      });
    }
  }

  void _loadUserData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userProvider = Provider.of<ProfileProvider>(context, listen: false);
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      await userProvider.fetchUser(loginProvider.uuid.toString());
    } catch (e) {
      // Optionally handle errors here
      debugPrint("Error fetching user in settings: $e");
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Setting the updated data in the new map and then will send that map itself in the put api

  void _updateProfileData() async {
    setState(() {
      _isLoading = true;
    });

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    Map<String, dynamic> updatedData = {};
    if (_emailController.text !=
        (_originalData.containsKey('email') ? _originalData['email'] : '')) {
      setState(() {
        updatedData['email'] = _emailController.text;
      });
    }
    if (_selectedUserType !=
        (_originalData.containsKey('user_type')
            ? _originalData['user_type']
            : '')) {
      setState(() {
        updatedData['user_type'] = _selectedUserType;
      });
    }
    if (_firstNameController.text !=
        (_originalData.containsKey('first_name')
            ? _originalData['first_name']
            : '')) {
      setState(() {
        updatedData['first_name'] = _firstNameController.text;
      });
    }
    if (_lastNameController.text !=
        (_originalData.containsKey('last_name')
            ? _originalData['last_name']
            : '')) {
      setState(() {
        updatedData['last_name'] = _lastNameController.text;
      });
    }
    if (_usernameController.text !=
        (_originalData.containsKey('username')
            ? _originalData['username']
            : '')) {
      setState(() {
        updatedData['username'] = _usernameController.text;
      });
    }
    if (_selectedGender !=
        (_originalData.containsKey('gender') ? _originalData['gender'] : '')) {
      setState(() {
        updatedData['gender'] = _selectedGender;
      });
    }
    if (_cityController.text !=
        (_originalData.containsKey('city') ? _originalData['city'] : '')) {
      setState(() {
        updatedData['city'] = _cityController.text;
      });
    }
    if (_degreeController.text !=
        (_originalData.containsKey('degree') ? _originalData['degree'] : '')) {
      setState(() {
        updatedData['degree'] = _degreeController.text;
      });
    }
    if (_phoneController.text !=
        (_originalData.containsKey('phone') ? _originalData['phone'] : '')) {
      setState(() {
        updatedData['phone'] = _phoneController.text;
      });
    }
    if (_organizationController.text !=
        (_originalData.containsKey('organisation')
            ? _originalData['organisation']
            : '')) {
      setState(() {
        updatedData['organisation'] = _organizationController.text;
      });
    }
    if (_courseController.text !=
        (_originalData.containsKey('cousrse_name')
            ? _originalData['cousrse_name']
            : '')) {
      setState(() {
        updatedData['specialization'] = _courseController.text;
        updatedData['cousrse_name'] = _courseController.text;
      });
    }
    if (_durationController.text !=
        (_originalData.containsKey('course_end_year')
            ? _originalData['course_end_year']
            : '')) {
      setState(() {
        updatedData['course_end_year'] =
            _durationController.text.isNotEmpty ? _durationController.text : -1;
      });
    }
    if (_dobController.text !=
        (_originalData.containsKey('date_of_birth')
            ? _originalData['date_of_birth']
            : '')) {
      setState(() {
        updatedData['date_of_birth'] =
            _dobController.text.isNotEmpty ? _dobController : null;
      });
    }
    if (_aboutController.text !=
        (_originalData.containsKey('about') ? _originalData['about'] : '')) {
      setState(() {
        updatedData['about'] = _aboutController.text;
      });
    }
    if (_selectedEducationalQualification !=
        (_originalData.containsKey('education_qualification')
            ? _originalData['education_qualification']
            : '')) {
      setState(() {
        updatedData['education_qualification'] =
            _selectedEducationalQualification;
      });
    }
    if (_percentageController.text !=
        (_originalData.containsKey('percentage')
            ? _originalData['percentage']
            : '')) {
      setState(() {
        updatedData['percentage'] = _percentageController.text.isNotEmpty
            ? _percentageController.text
            : -1;
      });
    }

    if (listsAreDifferent(skills,
        (_originalData.containsKey('skill') ? _originalData['skill'] : []))) {
      setState(() {
        updatedData['skill'] = skills;
      });
    }

    if (listsAreDifferent(
        interests,
        (_originalData.containsKey('interest')
            ? _originalData['interest']['key']
            : []))) {
      setState(() {
        updatedData['interest'] = {'key': interests};
      });
    }

    if (_linkedInController.text !=
        (_originalData.containsKey('linkedin')
            ? _originalData['linkedin']
            : '')) {
      setState(() {
        updatedData['linkedin'] = _linkedInController.text;
      });
    }
    if (_facebookController.text !=
        (_originalData.containsKey('facebook')
            ? _originalData['facebook']
            : '')) {
      setState(() {
        updatedData['facebook'] = _facebookController.text;
      });
    }
    if (_XController.text !=
        (_originalData.containsKey('x') ? _originalData['x'] : '')) {
      setState(() {
        updatedData['x'] = _XController.text;
      });
    }
    if (_instagramController.text !=
        (_originalData.containsKey('instagram')
            ? _originalData['instagram']
            : '')) {
      setState(() {
        updatedData['instagram'] = _instagramController.text;
      });
    }
    if (_githubController.text !=
        (_originalData.containsKey('github') ? _originalData['github'] : '')) {
      setState(() {
        updatedData['github'] = _githubController.text;
      });
    }
    if (_mediumController.text !=
        (_originalData.containsKey('medium') ? _originalData['medium'] : '')) {
      setState(() {
        updatedData['medium'] = _mediumController.text;
      });
    }
    if (_redditController.text !=
        (_originalData.containsKey('reddit') ? _originalData['reddit'] : '')) {
      setState(() {
        updatedData['reddit'] = _redditController.text;
      });
    }
    if (_slackController.text !=
        (_originalData.containsKey('slack') ? _originalData['slack'] : '')) {
      setState(() {
        updatedData['slack'] = _slackController.text;
      });
    }
    if (_dribbleController.text !=
        (_originalData.containsKey('dribble')
            ? _originalData['dribble']
            : '')) {
      setState(() {
        updatedData['dribble'] = _dribbleController.text;
      });
      if (_behanceController.text !=
          (_originalData.containsKey('behance')
              ? _originalData['behance']
              : '')) {
        setState(() {
          updatedData['behance'] = _behanceController.text;
        });
      }
      if (_codepenController.text !=
          (_originalData.containsKey('codepen')
              ? _originalData['codepen']
              : '')) {
        setState(() {
          updatedData['codepen'] = _codepenController.text;
        });
      }
      if (_figmaController.text !=
          (_originalData.containsKey('figma') ? _originalData['figma'] : '')) {
        setState(() {
          updatedData['figma'] = _figmaController.text;
        });
      }
    }
    if (updatedData.isNotEmpty) {
      updateUserPost(updatedData, loginProvider.uuid).then((value) {
        if (value) {
          setState(() {
            updatedData.clear();
          });
          _loadUserData();
        } else {
          debugPrint('error occured');
        }
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool listsAreDifferent(List<String> original, List<String> current) {
    if (original.length != current.length) return true;
    for (int i = 0; i < original.length; i++) {
      if (original[i] != current[i]) return true;
    }
    return false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _cityController.dispose();
    _aboutController.dispose();
    _organizationController.dispose();
    _degreeController.dispose();
    _durationController.dispose();
    _courseController.dispose();
    _percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
          width: double.infinity,
          height: scaleHeight(context, 820),
          decoration: const BoxDecoration(
              color: Color(0xffdfe1e2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
          child: const Center(child: CircularProgressIndicator()));
    } else {
      return Container(
        decoration: const BoxDecoration(
            color: Color(0xffdfe1e2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
        width: double.infinity,
        height: scaleHeight(context, 820),
        child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: scaleWidth(context, 33),
                vertical: scaleHeight(context, 48)),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            padding: EdgeInsets.only(
                top: scaleHeight(context, 31),
                left: scaleWidth(context, 37),
                right: scaleWidth(context, 37)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Settings',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleWidth(context, 22),
                        color: const Color(0xff1a202c),
                        height: lineHeight(28.8, 22),
                        fontWeight: FontWeight.w500)),
                SizedBox(height: scaleHeight(context, 24)),
                ExpansionTile(
                  collapsedBackgroundColor: const Color(0xffE2E2E2),
                  backgroundColor: const Color(0xffE2E2E2),
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  collapsedShape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  title: Text('Edit Profile',
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 19),
                          color: const Color(0xff1a202c),
                          height: lineHeight(25.2, 19),
                          fontWeight: FontWeight.w400)),
                  children: [
                    Container(
                      height: scaleHeight(context, 550),
                      padding: EdgeInsets.only(
                          left: scaleWidth(context, 16),
                          right: scaleWidth(context, 16)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        createFields(
                                            'Email*',
                                            'hackcraft661@gmail.com',
                                            context,
                                            _emailController,
                                            TextInputType.emailAddress,
                                            false,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          // Custom email validation using RegExp
                                          RegExp regex = RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                          if (!regex.hasMatch(value)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null; // Return null if validation passes
                                        }),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createFields(
                                            'Username*',
                                            '_shanaya@20',
                                            context,
                                            _usernameController,
                                            TextInputType.name,
                                            true,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          return null; // Return null if validation passes
                                        }),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createFields(
                                            'Mobile No.',
                                            '9087654321',
                                            context,
                                            _phoneController,
                                            TextInputType.number,
                                            true,
                                            false,
                                            true, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          RegExp regex = RegExp(r'^[0-9]{10}$');
                                          if (value.isNotEmpty) {
                                            if (!regex.hasMatch(value)) {
                                              return 'Please enter a valid phone number';
                                            }
                                          }

                                          return null; // Return null if validation passes
                                        }),
                                      ],
                                    ),
                                    SizedBox(height: scaleHeight(context, 24)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        createFields(
                                            'First Name*',
                                            'Shanaya',
                                            context,
                                            _firstNameController,
                                            TextInputType.name,
                                            true,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          return null; // Return null if validation passes
                                        }),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createFields(
                                            'Last Name*',
                                            'Gautam',
                                            context,
                                            _lastNameController,
                                            TextInputType.name,
                                            true,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          return null; // Return null if validation passes
                                        }),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createDropDownFields(
                                            'Gender*',
                                            'Select your gender',
                                            genders,
                                            context,
                                            _selectedGender, (value) {
                                          setState(() {
                                            _selectedGender = value;
                                          });
                                        }),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createFields(
                                            'Date Of Birth',
                                            'Enter your Date Of Birth (DD/MM/YYYY)',
                                            context,
                                            _dobController,
                                            TextInputType.datetime,
                                            true,
                                            true,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          // Custom date of birth validation (DD/MM/YYYY format)
                                          RegExp regex =
                                              RegExp(r'^\d{4}-\d{2}-\d{2}$');
                                          if (!regex.hasMatch(value)) {
                                            return 'Please enter a valid date in the format YYYY-MM-DD';
                                          }
                                          List<String> dateParts =
                                              value.split('-');
                                          int year =
                                              int.tryParse(dateParts[0]) ?? 0;
                                          int month =
                                              int.tryParse(dateParts[1]) ?? 0;
                                          int day =
                                              int.tryParse(dateParts[2]) ?? 0;

                                          // Validate year, month, and day values
                                          if (month < 1 || month > 12) {
                                            return 'Invalid month. Please enter a valid date.';
                                          }

                                          if (day < 1 || day > 31) {
                                            return 'Invalid day. Please enter a valid date.';
                                          }

                                          if (month == 2) {
                                            // Check for February (considering leap years)
                                            bool isLeapYear = (year % 4 == 0 &&
                                                    year % 100 != 0) ||
                                                (year % 400 == 0);
                                            if (day > 29 ||
                                                (day > 28 && !isLeapYear)) {
                                              return 'Please enter a valid date.';
                                            }
                                          } else if ([4, 6, 9, 11]
                                              .contains(month)) {
                                            // Check for months with 30 days
                                            if (day > 30) {
                                              return 'Please enter a valid date.';
                                            }
                                          }
                                          return null; // Return null if validation passes
                                        })
                                      ],
                                    ),
                                    SizedBox(height: scaleHeight(context, 24)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        createFields(
                                            'City*',
                                            'Enter your city',
                                            context,
                                            _cityController,
                                            TextInputType.text,
                                            true,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          return null;
                                        }, flex: 24),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createFields(
                                            'About',
                                            'Enter something about yourself',
                                            context,
                                            _aboutController,
                                            TextInputType.text,
                                            true,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          return null;
                                        }, flex: 76)
                                      ],
                                    ),
                                    SizedBox(height: scaleHeight(context, 24)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        createDropDownFields(
                                            'User Type',
                                            'Select type',
                                            userTypes,
                                            context,
                                            _selectedUserType, (value) {
                                          setState(() {
                                            _selectedUserType = value;
                                          });
                                        }, flex: 20),
                                        SizedBox(
                                            width: scaleWidth(context, 16)),
                                        createFields(
                                            'Organization*',
                                            'Enter your organization',
                                            context,
                                            _organizationController,
                                            TextInputType.text,
                                            true,
                                            false,
                                            false, (value) {
                                          if (value == null || value.isEmpty) {
                                            return null;
                                          }
                                          return null;
                                        }, flex: 80)
                                      ],
                                    ),
                                    SizedBox(height: scaleHeight(context, 24)),
                                    if (_selectedUserType == "student") ...[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          createDropDownFields(
                                              'Educational Qualification',
                                              'Select your educational qualification',
                                              educationalQualifications,
                                              context,
                                              _selectedEducationalQualification,
                                              (value) {
                                            setState(() {
                                              _selectedEducationalQualification =
                                                  value;
                                            });
                                          }),
                                          SizedBox(
                                              width: scaleWidth(context, 16)),
                                          createFields(
                                              'Percentage',
                                              'Enter your percentage',
                                              context,
                                              _percentageController,
                                              TextInputType.number,
                                              true,
                                              false,
                                              false, (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return null;
                                            }
                                            if (int.tryParse(value)! < 0 &&
                                                int.tryParse(value)! > 100) {
                                              return "Enter a valid percentage";
                                            }
                                            return null;
                                          })
                                        ],
                                      ),
                                      SizedBox(
                                          height: scaleHeight(context, 24)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          createFields(
                                              'Degree',
                                              'Enter your degree',
                                              context,
                                              _degreeController,
                                              TextInputType.text,
                                              true,
                                              false,
                                              false, (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return null;
                                            }

                                            return null;
                                          }),
                                          SizedBox(
                                              width: scaleWidth(context, 16)),
                                          createFields(
                                              'Ending Year of Course',
                                              'Enter the ending year of your course',
                                              context,
                                              _durationController,
                                              TextInputType.number,
                                              true,
                                              false,
                                              false, (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return null;
                                            }
                                            int? year = int.tryParse(value);
                                            if (year! < DateTime.now().year) {
                                              return 'Please enter a valid year';
                                            }
                                            return null;
                                          }),
                                          SizedBox(
                                              width: scaleWidth(context, 16)),
                                          createFields(
                                              'Course',
                                              'Enter your course',
                                              context,
                                              _courseController,
                                              TextInputType.text,
                                              true,
                                              false,
                                              false, (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return null;
                                            }

                                            return null;
                                          }),
                                        ],
                                      ),
                                      SizedBox(
                                          height: scaleHeight(context, 24)),
                                    ],
                                    Text('Skills',
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleWidth(context, 14),
                                            color: const Color(0xff1a202c),
                                            height: lineHeight(19.2, 14),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: scaleHeight(context, 9)),
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 9,
                                              child: TextFormField(
                                                controller: _skillsController,
                                                decoration: InputDecoration(
                                                  enabled: true,
                                                  hintText: "Enter your skills",
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                          fontFamily2,
                                                          fontSize: scaleWidth(
                                                              context, 14),
                                                          color: const Color(
                                                                  0xff1a202c)
                                                              .withOpacity(0.8),
                                                          height: lineHeight(
                                                              19.2, 14),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: scaleWidth(
                                                              context, 20)),
                                                  hintStyle:
                                                      GoogleFonts.getFont(
                                                          fontFamily2,
                                                          fontSize: scaleWidth(
                                                              context, 14),
                                                          color: const Color(
                                                                  0xff1a202c)
                                                              .withOpacity(0.8),
                                                          height: lineHeight(
                                                              19.2, 14),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xff484848)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xfff05656)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_skillsController
                                                            .text.isNotEmpty) {
                                                          skills.add(
                                                              _skillsController
                                                                  .text);
                                                          _skillsController
                                                              .clear();
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: const Color(
                                                              0xff1a202c)
                                                          .withOpacity(0.8),
                                                      size: scaleWidth(
                                                          context, 20),
                                                    )))
                                          ],
                                        )),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    Wrap(
                                      spacing: 9,
                                      children: skills.map((option) {
                                        int index = skills.indexOf(option);
                                        return InputChip(
                                          backgroundColor: chipColors[
                                              index % chipColors.length],
                                          side: BorderSide(
                                              color: chipTextColors[index %
                                                  chipTextColors.length]),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: scaleHeight(context, 5),
                                              horizontal:
                                                  scaleWidth(context, 13)),
                                          label: Padding(
                                            padding: EdgeInsets.only(
                                                right: scaleWidth(context, 38)),
                                            child: Text(option,
                                                style: GoogleFonts.getFont(
                                                    fontFamily2,
                                                    fontSize:
                                                        scaleWidth(context, 14),
                                                    color: chipTextColors[
                                                        index %
                                                            chipTextColors
                                                                .length],
                                                    height:
                                                        lineHeight(16.8, 14),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          deleteIcon: SvgPicture.asset(
                                            'assets/icons/defaultEditPortal/deleteIcon.svg',
                                            colorFilter: ColorFilter.mode(
                                                chipTextColors[index %
                                                    chipTextColors.length],
                                                BlendMode.srcIn),
                                          ),
                                          onDeleted: () {
                                            setState(() {
                                              skills.remove(option);
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: scaleHeight(context, 24)),
                                    Text('Interests',
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleWidth(context, 14),
                                            color: const Color(0xff1a202c),
                                            height: lineHeight(19.2, 14),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: scaleHeight(context, 9)),
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 9,
                                              child: TextFormField(
                                                controller:
                                                    _interestsController,
                                                decoration: InputDecoration(
                                                  enabled: true,
                                                  hintText: "Enter your interests",
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                          fontFamily2,
                                                          fontSize: scaleWidth(
                                                              context, 14),
                                                          color: const Color(
                                                                  0xff1a202c)
                                                              .withOpacity(0.8),
                                                          height: lineHeight(
                                                              19.2, 14),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: scaleWidth(
                                                              context, 20)),
                                                  hintStyle:
                                                      GoogleFonts.getFont(
                                                          fontFamily2,
                                                          fontSize: scaleWidth(
                                                              context, 14),
                                                          color: const Color(
                                                                  0xff1a202c)
                                                              .withOpacity(0.8),
                                                          height: lineHeight(
                                                              19.2, 14),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xff484848)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xfff05656)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_interestsController
                                                            .text.isNotEmpty) {
                                                          interests.add(
                                                              _interestsController
                                                                  .text);
                                                          _interestsController
                                                              .clear();
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: const Color(
                                                              0xff1a202c)
                                                          .withOpacity(0.8),
                                                      size: scaleWidth(
                                                          context, 20),
                                                    )))
                                          ],
                                        )),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    Wrap(
                                      spacing: 9,
                                      children: interests.map((option) {
                                        int index = interests.indexOf(option);
                                        return InputChip(
                                          backgroundColor: chipColors[
                                              index % chipColors.length],
                                          side: BorderSide(
                                              color: chipTextColors[index %
                                                  chipTextColors.length]),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: scaleHeight(context, 5),
                                              horizontal:
                                                  scaleWidth(context, 13)),
                                          label: Padding(
                                            padding: EdgeInsets.only(
                                                right: scaleWidth(context, 38)),
                                            child: Text(option,
                                                style: GoogleFonts.getFont(
                                                    fontFamily2,
                                                    fontSize:
                                                        scaleWidth(context, 14),
                                                    color: chipTextColors[
                                                        index %
                                                            chipTextColors
                                                                .length],
                                                    height:
                                                        lineHeight(16.8, 14),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          deleteIcon: SvgPicture.asset(
                                            'assets/icons/defaultEditPortal/deleteIcon.svg',
                                            colorFilter: ColorFilter.mode(
                                                chipTextColors[index %
                                                    chipTextColors.length],
                                                BlendMode.srcIn),
                                          ),
                                          onDeleted: () {
                                            setState(() {
                                              interests.remove(option);
                                              debugPrint('interest : $interests');
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: scaleHeight(context, 24)),
                                    Text('Social Links',
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleWidth(context, 14),
                                            color: const Color(0xff1a202c),
                                            height: lineHeight(19.2, 14),
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(height: scaleHeight(context, 9)),
                                    createSocialLinks(
                                        'LinkedIn',
                                        'Enter your linkedin url',
                                        context,
                                        _linkedInController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Facebook',
                                        'Enter your facebook url',
                                        context,
                                        _facebookController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'X',
                                        'Enter your X url',
                                        context,
                                        _XController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Instagram',
                                        'Enter your instagram url',
                                        context,
                                        _instagramController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Github',
                                        'Enter your github url',
                                        context,
                                        _githubController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Medium',
                                        'Enter your Medium url',
                                        context,
                                        _mediumController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Reddit',
                                        'Enter your reddit url',
                                        context,
                                        _redditController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Slack',
                                        'Enter your slack url',
                                        context,
                                        _slackController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }

                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Dribble',
                                        'Enter your dribble url',
                                        context,
                                        _dribbleController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Behance',
                                        'Enter your behance url',
                                        context,
                                        _behanceController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Codepen',
                                        'Enter your codepen url',
                                        context,
                                        _codepenController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null;
                                      }
                                      if (value.isNotEmpty) {
                                        Uri? uri =
                                            Uri.tryParse(value.toString());

                                        // Check if the Uri object is not null and is a valid URL
                                        if (uri != null &&
                                            uri.isAbsolute &&
                                            (uri.scheme == 'http' ||
                                                uri.scheme == 'https')) {
                                          return null;
                                        } else {
                                          return "Invalid url";
                                        }
                                      }
                                      return null;
                                    }),
                                    SizedBox(height: scaleHeight(context, 12)),
                                    createSocialLinks(
                                        'Figma',
                                        'Enter your figma url',
                                        context,
                                        _figmaController,
                                        TextInputType.url, (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == " ") {
                                        return null; // No error if empty or null
                                      }

                                      // Try to parse the URL
                                      Uri? uri = Uri.tryParse(value);

                                      // Check if the Uri is valid
                                      if (uri != null &&
                                          uri.isAbsolute &&
                                          (uri.scheme == 'http' ||
                                              uri.scheme == 'https')) {
                                        return null; // URL is valid
                                      } else {
                                        return "Invalid URL"; // URL is invalid
                                      }
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  // Form is valid; proceed with saving/updating the information
                                  debugPrint('Form validated successfully.');
                                  if (_usernameController.text.isNotEmpty &&
                                      _firstNameController.text.isNotEmpty &&
                                      _lastNameController.text.isNotEmpty &&
                                      _cityController.text.isNotEmpty &&
                                      _organizationController.text.isNotEmpty) {
                                    _updateProfileData();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please fill all required fields.'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                } else {
                                  // Validation failed
                                  debugPrint('Form validation failed.');
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: scaleHeight(context, 48),
                                margin: EdgeInsets.symmetric(
                                    vertical: scaleHeight(context, 24)),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xffA6A5A5)),
                                alignment: Alignment.center,
                                child: Text('Update',
                                    style: GoogleFonts.getFont(fontFamily2,
                                        fontSize: scaleWidth(context, 14),
                                        color: const Color(0xff1a202c),
                                        height: lineHeight(19.2, 14),
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      );
    }
  }
}




