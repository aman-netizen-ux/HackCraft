import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Registation/sendUserProfile.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/Registation/updateUserProfile.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedUserType;
  String? selectedGender;
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  // Dummy data for dropdowns
  final List<String> userTypes = ['professional', 'student'];
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: heightScaler(context, 0)),
          child: SizedBox(
            width: widthScaler(context, 502),
            height: heightScaler(context, 292),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: heightScaler(context, 49)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: heightScaler(context, 45),
                          width: widthScaler(context, 209),
                          child: DropdownButtonFormField<String>(
                            value: selectedUserType,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedUserType = newValue;
                                });
                              }
                            },
                            items: userTypes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.firaSans(
                                    fontSize: heightScaler(context, 14),
                                    fontWeight: FontWeight.w500,
                                    color: concreteGrey,
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: black1,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'UserType',
                              labelStyle: GoogleFonts.firaSans(
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w400,
                                color: concreteGrey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: widthScaler(context, 12)),
                        SizedBox(
                          height: heightScaler(context, 45),
                          width: widthScaler(context, 209),
                          child: DropdownButtonFormField<String>(
                            value: selectedGender,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              }
                            },
                            items: genders.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.firaSans(
                                    fontSize: heightScaler(context, 14),
                                    fontWeight: FontWeight.w500,
                                    color: concreteGrey,
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: black1,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Gender',
                              labelStyle: GoogleFonts.firaSans(
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w400,
                                color: concreteGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightScaler(context, 17)),
                    SizedBox(
                      height: heightScaler(context, 40),
                      width: widthScaler(context, 430),
                      child: TextFormField(
                        controller: usernameController,
                        style: GoogleFonts.firaSans(
                          fontSize: heightScaler(context, 14),
                          fontWeight: FontWeight.w500,
                          color: concreteGrey,
                        ),
                        cursorColor: darkCharcoal,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: widthScaler(context, 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                          labelText: 'Username',
                          labelStyle: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 16),
                            fontWeight: FontWeight.w400,
                            color: concreteGrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: heightScaler(context, 17)),
                    SizedBox(
                      height: heightScaler(context, 40),
                      width: widthScaler(context, 430),
                      child: TextFormField(
                        style: GoogleFonts.firaSans(
                          fontSize: heightScaler(context, 14),
                          fontWeight: FontWeight.w500,
                          color: concreteGrey,
                        ),
                        controller: cityController,
                        cursorColor: darkCharcoal,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: widthScaler(context, 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                          labelText: 'City',
                          labelStyle: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 16),
                            fontWeight: FontWeight.w400,
                            color: concreteGrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: heightScaler(context, 17)),
                    SizedBox(
                      height: heightScaler(context, 40),
                      width: widthScaler(context, 430),
                      child: TextFormField(
                        style: GoogleFonts.firaSans(
                          fontSize: heightScaler(context, 14),
                          fontWeight: FontWeight.w500,
                          color: concreteGrey,
                        ),
                        controller: organizationController,
                        cursorColor: darkCharcoal,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: widthScaler(context, 20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                          labelText: 'Organization',
                          labelStyle: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 16),
                            fontWeight: FontWeight.w400,
                            color: concreteGrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: black1,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: widthScaler(context, 140),
          height: heightScaler(context, 40),
          margin: EdgeInsets.symmetric(vertical: widthScaler(context, 20)),
          child: ElevatedButton(
            onPressed: () {
              final loginProvider =
                  Provider.of<LoginProvider>(context, listen: false);
              String username = usernameController.text;
              String userType = selectedUserType!;
              String gender = selectedGender!;
              String city = cityController.text;
              String organization = organizationController.text;

              updateUserPost(
                {
                  "user_type": userType,
                  "username": username,
                  "gender": gender,
                  "city": city,
                  "organisation": organization
                },
                loginProvider.uuid,
              );

              Navigator.pushNamed(context, '/mainNavigation');
              loginProvider.setEmail("");
              loginProvider.setOtpId(0);
              loginProvider.setPassword('');
              loginProvider.setCurrentIndex(0);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff518AFA)),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                const Size(160, 50),
              ),
            ),
            child: const Text(
              "Next ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
