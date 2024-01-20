import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/defaultTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_textFormField.dart';
import 'package:provider/provider.dart';

class DefaultEditContactUsAndFooterSection extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditContactUsAndFooterSection(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  State<DefaultEditContactUsAndFooterSection> createState() =>
      _DefaultEditContactUsAndFooterSectionState();
}

class _DefaultEditContactUsAndFooterSectionState
    extends State<DefaultEditContactUsAndFooterSection> {


late TextEditingController contactMemberName1Controller;
late TextEditingController contactMemberName2Controller;
late TextEditingController contactMemberNumber1Controller;
late TextEditingController contactMemberNumber2Controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    contactMemberName1Controller = TextEditingController();
    contactMemberName2Controller = TextEditingController();
    contactMemberNumber1Controller = TextEditingController();
    contactMemberNumber2Controller = TextEditingController();

    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);

    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context, listen: false);

     hackathonTextPropertiesProvider.textFieldPropertiesMap[contactName1Key] =
        TextFieldProperties(
       size: 18,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C)',
      underline: false,
      upperCase: false,
    );




hackathonTextPropertiesProvider.textFieldPropertiesMap[contactName2Key] =
        TextFieldProperties(
      size: 18,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C)',
      underline: false,
      upperCase: false,
    );




    hackathonTextPropertiesProvider.textFieldPropertiesMap[contactNumber1Key] =
        TextFieldProperties(
      size: 16,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C)',
      underline: false,
      upperCase: false,
    );



    hackathonTextPropertiesProvider.textFieldPropertiesMap[contactNumber2Key] =
        TextFieldProperties(
      size: 16,
      //size: hackathonDetailsProvider.hackathonDetails.fields[0].textProperties.size,
      align: 'left',
      font: 'Fira Sans',
      fontWeight: 400,
      italics: false,
      letterSpacing: 0,
      strikethrogh: false,
      textColor: 'Color(0xFF1A202C)',
      underline: false,
      upperCase: false,
    );



    if (hackathonDetailsProvider.contact1Name.isNotEmpty) {
      contactMemberName1Controller.text = hackathonDetailsProvider.contact1Name;
    }

    if (hackathonDetailsProvider.contact1Number.isNotEmpty) {
      contactMemberNumber1Controller.text =
          hackathonDetailsProvider.contact1Number;
    }

    if (hackathonDetailsProvider.contact2Name.isNotEmpty) {
      contactMemberName2Controller.text = hackathonDetailsProvider.contact2Name;
    }

    if (hackathonDetailsProvider.contact2Number.isNotEmpty) {
      contactMemberNumber2Controller.text =
          hackathonDetailsProvider.contact2Number;
    }



  }

  @override
  void dispose() {
    contactMemberName1Controller.dispose();
    contactMemberName2Controller.dispose();
    contactMemberNumber1Controller.dispose();
    contactMemberNumber2Controller.dispose();


    // TODO: implement dispose
    super.dispose();
  }


  List<String> footerLinks = [
    "Terms",
    "FAQ",
    "Privacy",
    "Careers",
    "How To",
    "Give Feedback"
  ];
  @override
  Widget build(BuildContext context) {
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
      
      final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);


     WidgetsBinding.instance.addPostFrameCallback((_) {
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          contactMemberName1Controller, contactName1Key);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          contactMemberName2Controller, contactName2Key);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          contactMemberNumber1Controller, contactNumber1Key);
      hackathonTextPropertiesProvider.convertAndRevertBackFromUpperCase(
          contactMemberNumber2Controller, contactNumber2Key);
     
    });
    
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: defaultEditScaleHeight(widget.containerHeight, 25),
            left: defaultEditScaleWidth(widget.containerWidth, 81),
            right: defaultEditScaleWidth(widget.containerWidth, 81),
          ),
          child: Text('Contact Us',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: defaultEditScaleHeight(widget.containerHeight, 48),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: lineHeight(22.4, 48))),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: defaultEditScaleHeight(widget.containerHeight, 43),
            left: defaultEditScaleWidth(widget.containerWidth, 81),
            right: defaultEditScaleWidth(widget.containerWidth, 81),
          ),
          child: SizedBox(
            // height: defaultEditScaleHeight(widget.containerHeight, 173),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            decoration: BoxDecoration(
                                color: lavender,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child: DefaultTemplateTextFormField(
                                  hintText:'Contact Member Name',
                                  containerHeight: widget.containerHeight,
                                  fieldKey: contactName1Key,
                                  controller: contactMemberName1Controller,
                                 onSaved: (value) {
                                hackathonDetailsProvider.contact1Name =
                                    value.toString();
                                  },
                                ),
                              ),
                              // Text('Contact Member Name ',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(widget.containerHeight, 18),
                              //         color: black1,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(29, 18))),
                              SizedBox(
                                height: defaultEditScaleHeight(
                                    widget.containerHeight, 5),
                              ),

                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child:DefaultTemplateTextFormField(
                                  hintText:'Contact Number',
                                  fieldKey:  contactNumber1Key,
                                  controller: contactMemberNumber1Controller,
                                  containerHeight: widget.containerHeight,
                                  maxLength: 30,                      
                                  height: 5,            
                                  onSaved: (value) {
                                    hackathonDetailsProvider.contact1Number =
                                        value.toString();
                                  },
                                ),
                                
                                
                                 
                              ),
                              // Text('Contact Number',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(
                              //             widget.containerHeight, 16),
                              //         color: black5,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(5, 16))),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            defaultEditScaleHeight(widget.containerHeight, 27),
                      ),
                      Row(
                        children: [
                          Container(
                            height: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 40),
                            decoration: BoxDecoration(
                                color: lavender,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          SizedBox(
                            width: defaultEditScaleWidth(
                                widget.containerWidth, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child:  DefaultTemplateTextFormField(
                                  hintText:'Contact Member Name',
                                  fieldKey: contactName2Key,
                                  controller: contactMemberName2Controller,
                                  containerHeight: widget.containerHeight,
                                  maxLength: 30,                          
                                  height: 10,        
                                 onSaved: (value) {
                                    hackathonDetailsProvider.contact2Name =
                                        value.toString();
                                  },
                                ),
                                
                                
                              ),
                              // Text('Contact Member Name ',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(
                              //             widget.containerHeight, 18),
                              //         color: black1,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(29, 18))),
                              SizedBox(
                                height: defaultEditScaleHeight(
                                    widget.containerHeight, 5),
                              ),

                              SizedBox(
                                height: 30,
                                width: defaultEditScaleWidth(
                                    widget.containerWidth, 300),
                                child: DefaultTemplateTextFormField(
                                  hintText:'Contact Number',
                                  fieldKey:  contactNumber2Key,
                                  controller: contactMemberNumber2Controller,
                                  containerHeight: widget.containerHeight,
                                  maxLength: 30,                      
                                  height: 29,            
                                 onSaved: (value) {
                                    hackathonDetailsProvider.contact2Number =
                                        value.toString();
                                  },
                                ),
                                
                                
                                
                              ),
                              // Text('Contact Number',
                              //     style: GoogleFonts.getFont(fontFamily2,
                              //         fontSize: defaultEditScaleHeight(
                              //             widget.containerHeight, 16),
                              //         color: black5,
                              //         fontWeight: FontWeight.w400,
                              //         height: lineHeight(5, 16))),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(flex: 6, child: Container())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
