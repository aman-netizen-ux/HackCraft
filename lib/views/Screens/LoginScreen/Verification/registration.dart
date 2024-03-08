import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedUserType;
  String? selectedGender;
  String? selectedCity;
  String? selectedOrganization;
  TextEditingController usernameController = TextEditingController();

  // Dummy data for dropdowns
  final List<String> userTypes = ['Organizer', 'Student'];
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> cities = ['New York', 'London', 'Dubai', 'Chennai'];
  final List<String> organizations = [
    'Organization A',
    'Organization B',
    'Organization C'
  ];

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
                          height: heightScaler(context, 40),
                          width: widthScaler(context, 209),
                          child: DropdownBelow(
                            itemWidth: widthScaler(context, 209),
                            itemTextstyle:
                                TextStyle(fontSize: heightScaler(context, 16)),
                            boxTextstyle:
                                TextStyle(fontSize: heightScaler(context, 16)),
                            boxPadding: EdgeInsets.symmetric(
                                horizontal: widthScaler(context, 27)),
                            boxHeight: heightScaler(context, 40),
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: darkCharcoal,
                                  width: 1,
                                )),
                            value: selectedUserType,
                            hint: Text(
                              '',
                              style: GoogleFonts.firaSans(
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w500,
                                color: concreteGrey,
                              ),
                            ),
                            items: userTypes
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedUserType = newValue;
                              });
                            },
                            icon: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                        SizedBox(width: widthScaler(context, 12)),
                        SizedBox(
                          height: heightScaler(context, 40),
                          width: widthScaler(context, 209),
                          child: DropdownBelow(
                            value: selectedGender,
                            itemWidth: widthScaler(context, 209),
                            itemTextstyle:
                                TextStyle(fontSize: heightScaler(context, 16)),
                            boxTextstyle:
                                TextStyle(fontSize: heightScaler(context, 16)),
                            boxPadding: EdgeInsets.symmetric(
                                horizontal: widthScaler(context, 27)),
                            boxHeight: heightScaler(context, 40),
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: darkCharcoal,
                                  width: 1,
                                )),
                            hint: Text(
                              'Select Gender',
                              style: GoogleFonts.firaSans(
                                fontSize: heightScaler(context, 16),
                                fontWeight: FontWeight.w500,
                                color: concreteGrey,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                            items: genders
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            icon: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightScaler(context, 17)),
                    SizedBox(
                      height: heightScaler(context, 40),
                      width: widthScaler(context, 430),
                      child: TextFormField(
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
                          hintStyle: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 16),
                            fontWeight: FontWeight.w500,
                            color: concreteGrey,
                          ),
                          hintText: 'Username',
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
                      child: DropdownBelow(
                        value: selectedCity,
                        itemWidth: widthScaler(context, 430),
                        itemTextstyle:
                            TextStyle(fontSize: heightScaler(context, 16)),
                        boxTextstyle:
                            TextStyle(fontSize: heightScaler(context, 16)),
                        boxPadding: EdgeInsets.symmetric(
                            horizontal: widthScaler(context, 27)),
                        boxHeight: heightScaler(context, 40),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: darkCharcoal,
                              width: 1,
                            )),
                        hint: Text(
                          'City',
                          style: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 16),
                            fontWeight: FontWeight.w500,
                            color: concreteGrey,
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity = newValue;
                          });
                        },
                        items: cities
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                    SizedBox(height: heightScaler(context, 17)),
                    SizedBox(
                      height: heightScaler(context, 40),
                      width: widthScaler(context, 430),
                      child: DropdownBelow(
                        value: selectedOrganization,
                        hint: Text(
                          'Organization',
                          style: GoogleFonts.firaSans(
                            fontSize: heightScaler(context, 16),
                            fontWeight: FontWeight.w500,
                            color: concreteGrey,
                          ),
                        ),
                        itemWidth: widthScaler(context, 209),
                        itemTextstyle:
                            TextStyle(fontSize: heightScaler(context, 16)),
                        boxTextstyle:
                            TextStyle(fontSize: heightScaler(context, 16)),
                        boxPadding: EdgeInsets.symmetric(
                            horizontal: widthScaler(context, 27)),
                        boxHeight: heightScaler(context, 40),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: darkCharcoal,
                              width: 1,
                            )),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOrganization = newValue;
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down),
                        items: organizations
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                onPressed: () async {
                
                  if (_formKey.currentState?.validate() ?? false) {
                    String username = usernameController.text;
                    String userType = selectedUserType!;
                    String gender = selectedGender!;
                    String city = selectedCity!;
                    String organization = selectedOrganization!;
                    if (userType.isEmpty) {
                      showSnackBar(
                          'Please Select UserType',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else if (gender.isEmpty) {
                      showSnackBar(
                          'Please Select Gender',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else if (username.isEmpty) {
                      showSnackBar(
                          'Please Select Username',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else if (city.isEmpty) {
                      showSnackBar(
                          'Please Select City',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else if (organization.isEmpty) {
                      showSnackBar(
                          'Please Select Organization',
                          red2,
                          const Icon(
                            Icons.warning,
                            color: white,
                          ),
                          context);
                    } else {
                      // Navigate to the next screen or perform other actions
                      Navigator.pushNamed(
                        context,
                        '/mainNavigation',
                      );
                    }

                    final loginProvider =
                        Provider.of<LoginProvider>(context, listen: false);
                    loginProvider.setCurrentIndex(0);
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff518AFA)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(160, 50)),
                ),
                child: const Text(
                  "Next ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )))
      ],
    );
  }
}
