import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/aboutUs_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/contactUsAndFooter_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/gallerySection.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: home,
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 81),
          vertical: scaleHeight(context, 39)),
      child: Column(
        children: [
          //NavBar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //container to be updated with image logic
                  Container(
                    height: scaleHeight(context, 44),
                    width: scaleHeight(context, 44),
                    color:Colors.black.withOpacity(0.3)
                  ),
                  SizedBox(width: scaleWidth(context, 6),),
                  Text(
                    'Your Hackathon',
                    style: GoogleFonts.getFont(
                      fontFamily2,fontSize: scaleHeight(context, 20),
                      color: black1,
                      fontWeight: FontWeight.w400,
                      height: lineHeight(22.4, 20)
                    )
                  ),
                 
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      scrollToItem(home);
                    },
                    child: Text(
                      'Home',
                      style: GoogleFonts.getFont(
                        fontFamily2,fontSize: scaleHeight(context, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14)
                      )
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      scrollToItem(rulesAndRounds);
                    },
                    child: Text(
                      'Rounds',
                      style: GoogleFonts.getFont(
                        fontFamily2,fontSize: scaleHeight(context, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14)
                      )
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      scrollToItem(aboutUs);
                    },
                    child: Text(
                      'About Us',
                      style: GoogleFonts.getFont(
                        fontFamily2,fontSize: scaleHeight(context, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14)
                      )
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      scrollToItem(gallery);
                    },
                    child: Text(
                      'Gallery',
                      style: GoogleFonts.getFont(
                        fontFamily2,fontSize: scaleHeight(context, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14)
                      )
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                     scrollToItem(contactUs);
                    },
                    child: Text(
                      'Contact Us',
                      style: GoogleFonts.getFont(
                        fontFamily2,fontSize: scaleHeight(context, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14)
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: scaleHeight(context, 70),
          ),

        //Landing Section
        Stack(
          
          clipBehavior: Clip.none,
          children: [
            
            Container(
              height: scaleHeight(context, 523),
              width: scaleWidth(context, 1108),  
              alignment: Alignment.center,            
              decoration: const BoxDecoration(
                color: lavender,
                borderRadius: BorderRadius.all(
                  Radius.circular(rad5_6)
                )
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                        'Organisation name presents',
                        style: GoogleFonts.getFont(
                          fontFamily2,
                          fontSize: scaleHeight(context, 20),
                          color: greyish1,
                          fontWeight: FontWeight.w500,
                          height: lineHeight(22.4, 20)
                        )
                      ),
              
                      SizedBox(height: scaleHeight(context, 42),),
              
                       Text(
                        'Your Hackathon Name',
                        style: GoogleFonts.getFont(
                          fontFamily2,
                          fontSize: scaleHeight(context, 54),
                          color: black2,
                          fontWeight: FontWeight.w600,
                          height: lineHeight(22.4, 54)
                        )
                      ),
              
                      SizedBox(height: scaleHeight(context, 11),),
              
                       Text(
                        'Give us brief about your hackathon (60 words)',
                        style: GoogleFonts.getFont(
                          fontFamily2,
                          fontSize: scaleHeight(context, 18),
                          color: greyish1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 18)
                        )
                      ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: -scaleHeight(context, 51),
              child: Container(
                width: scaleWidth(context, 1108),
                // padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 68.5)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  hackathonDetailContainer(detail: 'Date'),
                  hackathonDetailContainer(detail: 'Mode of Conduct'),
                  hackathonDetailContainer(detail: 'Participation fee'),
                  hackathonDetailContainer(detail: 'Team Size'),
                  hackathonDetailContainer(detail: 'Venue'),
                ],),
              ),
            ),
          ],
        ),
        
        //spacing
        SizedBox(height: scaleHeight(context,90),)
        ],
      ),
    );
  }
}

class hackathonDetailContainer extends StatelessWidget {
  const hackathonDetailContainer({
    super.key,
    required this.detail,
  });

  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: scaleHeight(context, 102),
    width: scaleWidth(context, 159),     
    alignment: Alignment.center,        
    padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 5),vertical: scaleHeight(context, 5)), 
    decoration: const BoxDecoration(
      color: black1,
      borderRadius: BorderRadius.all(
        Radius.circular(rad5_3)
      )
    ),
    child: Text(
                        detail,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          fontFamily2,
                          fontSize: scaleHeight(context, 20),
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: lineHeight(22.4, 20)
                        )
                      ),
            );
  }
}
